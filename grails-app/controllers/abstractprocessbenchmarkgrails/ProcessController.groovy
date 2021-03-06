package abstractprocessbenchmarkgrails

class ProcessController {

    static scaffold = true

    def clone(params) {
        // fetch original process
        def origProcessInstance = Process.get(params.id)
        
        // create new process
        def processInstance = new Process(params)
                
        // clone "process" object
        processInstance.alias = origProcessInstance.alias + " clone"
        processInstance.description = origProcessInstance.description
        processInstance.domain = origProcessInstance.domain

        // save new process instance
        if (!processInstance.save(flush: true)) {
            render(view: "create", model: [processInstance: processInstance])
            return
        }
        
        // clone all tasks (but don't clone sessions)
        def tasks = Task.findAllByProcess(origProcessInstance)
        tasks.each() { 
            println " ${it}" 
            def taskInstance = new Task()
            //println " ${it.sequence}"
            taskInstance.sequence = it.sequence
            taskInstance.role = it.role
            taskInstance.taskOwner = it.taskOwner
            taskInstance.system = it.system
            taskInstance.media = it.media
            taskInstance.view = it.view
            taskInstance.description = it.description
    
            taskInstance.process = processInstance
            
            if (!taskInstance.save(flush: true)) {
                render(view: "create", model: [processInstance: processInstance])
                return
            }
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'Process'), processInstance.id])
        redirect(action: "show", id: processInstance.id)

    }
    
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
}
