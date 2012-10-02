package abstractprocessbenchmarkgrails

class SessionController {

    static scaffold = true

    def beforeInterceptor = [action:this.&auth]
   
    def index() {
        redirect(action: "list")
    }
    
    def auth() {
        if(!session.user) {
            redirect(controller:"user", action:"login")
            return false
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def results = []
        if (session.user.role.description != Role.ADMIN) {
            // load domains of current user
            def myDomains = User.get(session.user.id).domains
            // get all users in these domains
            def _tempDomainUsers = myDomains.users // ArrayList
            
            // ArrayList of ArrayList of Users has to be iterated
            def domainUsers = []           
            _tempDomainUsers.each() {
                it.each() {
                    domainUsers.add(it)
                }
                
            }
            
            def session
            domainUsers.unique().each() {
                // iterator "it" is of class User
                session = Session.findAllBySessionOwner(it)
                if (session != null) {
                    session.each() {
                        results.add(it)
                    }
                    
                }
            }
            // only my sessions
            //results = Session.findAllBySessionOwner(User.get(session.user.id))
        } else {
            results = Session.findAll()
        }
        
        [sessionInstanceList: results, sessionInstanceTotal: results.size()]
    }
    
    // save as NEW
    def save() {        
        def sessionInstance = new Session(params)
        
        // do magic HERE
        // 1. look after Process and its Tasks
        // 2. for each task: create result
        
        def process = Process.get(params.process.id)
        def tasks = process.tasks
        tasks.each() {
            def result = new Result()
            result.task = it
            if (!result.save(flush: true)) {
                render(view: "create", model: [sessionInstance: sessionInstance])
                return
            }
        }

        // orig code (contd.)
        if (!sessionInstance.save(flush: true)) {
            render(view: "create", model: [sessionInstance: sessionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'session.label', default: 'Session'), sessionInstance.id])
        redirect(action: "show", id: sessionInstance.id)
    }
        
    // update existing entry
    def update(Long id, Long version) {
        println("UPDATE")
        
        def sessionInstance = Session.get(id)
        // do magic HERE
        // 1. look after Process and its Tasks
        // 2. for each task: create result
        
        def process = Process.get(params.process.id)
        def tasks = process.tasks
        tasks.each() {
            def result = new Result()
            result.task = it
            if (!result.save(flush: true)) {
                render(view: "create", model: [sessionInstance: sessionInstance])
                return
            }
        }

        if (!sessionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'session.label', default: 'Session'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sessionInstance.version > version) {
                sessionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'session.label', default: 'Session')] as Object[],
                          "Another session has updated this Session while you were editing")
                render(view: "edit", model: [sessionInstance: sessionInstance])
                return
            }
        }

        sessionInstance.properties = params

        if (!sessionInstance.save(flush: true)) {
            render(view: "edit", model: [sessionInstance: sessionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'session.label', default: 'Session'), sessionInstance.id])
        redirect(action: "show", id: sessionInstance.id)
        
    }
}
