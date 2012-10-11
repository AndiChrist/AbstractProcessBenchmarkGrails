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
         
        // check sequence number: if it exists twice, take this seq-no as defined, and all other sequences must add +1
        def previousTasks = taskInstance.process.tasks

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

        flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", controller: "process",  id: taskInstance.process.id)
    }
    
    def update(Long id, Long version) {
        def taskInstance = Task.get(id)
        def oldSeqNo = taskInstance.sequence
        
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (taskInstance.version > version) {
                taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'task.label', default: 'Task')] as Object[],
                          "Another task has updated this Task while you were editing")
                render(view: "edit", model: [taskInstance: taskInstance])
                return
            }
        }

        taskInstance.properties = params

        // check sequence number: if it exists twice, take this seq-no as defined, and all prior to that is reduced by 1
        def previousTasks = taskInstance.process.tasks
        
        // easy approach
        previousTasks.each() {
            // from oldSeqNo (excluded!) to taskInstance.sequence decrease by 1 (except the edited instance)
            if (it.sequence > oldSeqNo && it.sequence <= taskInstance.sequence && it.id != taskInstance.id) {
                it.sequence -= 1
                it.save(flush: true)
            }
        }
        
        if (!taskInstance.save(flush: true)) {
            render(view: "edit", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
        redirect(action: "show", id: taskInstance.id)
    }
}