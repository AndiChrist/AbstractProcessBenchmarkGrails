package abstractprocessbenchmarkgrails

class TaskController {
    
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
    
    def create() {        
        def taskInstance        = new Task()
        taskInstance.properties = params
                
        // add 1 to the latest task sequence no.
        taskInstance.sequence = taskInstance.process.tasks.size() + 1

        return [taskInstance: taskInstance]

    }
    
    def save() {
        def taskInstance = new Task(params)
        println("params: " + params)
         
        // check sequence number: if it exists twice, take this seq-no as defined, and all other sequences must add +1
        def previousTasks = taskInstance.process.tasks
        println("previousTasks: " + previousTasks)
        // easy approach
        previousTasks.each() {
            if (it.sequence >= taskInstance.sequence) {
                it.sequence += 1
                it.save(flush: true)
            }
        }
        
        if (!taskInstance.save(flush: true)) {
            render(view: "create", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", controller: "process",  id: taskInstance.process.id)
    }
    
}