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
    
    def create() { // TODO
        //[sessionInstance: new Session(params)]
        
        //def origSessionInstance = Session.get(params.id)
        def sessionInstance = new Session(params)

        if (!sessionInstance.save(flush: true)) {
            render(view: "create", model: [sessionInstance: sessionInstance])
            return
        }
        
        // now load all Task objects from the process and create a result for each
        //def tasks = 
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def results
        if (session.user.role.description != Role.ADMIN) {
            results = Session.findAllBySessionOwner(User.get(session.user.id))
        } else {
            results = Session.findAll()
        }
        
        [sessionInstanceList: results, sessionInstanceTotal: results.size()]
    }
}
