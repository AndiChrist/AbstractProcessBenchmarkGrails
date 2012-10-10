package abstractprocessbenchmarkgrails

class ResultController {

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
    
    // action for START button in session's show view
    def startTask() {
        def task = Task.get(params.taskId)
        def session = Session.get(params.sessionId)

        def result = Result.findByTaskAndSession(task, session)
        result.startTime = java.lang.System.currentTimeMillis()
        
        if (!result.save(flush: true)) {
            render(view: "create", model: [sessionInstance: session])
            return
        }
        
        redirect(controller:"session", action:"show", id: params.sessionId)
        return
    }
    
    // action for STOP button in session's show view
    def stopTask(Long id) {
        def task = Task.get(params.taskId)
        def session = Session.get(params.sessionId)
        
        def result = Result.findByTaskAndSession(task, session)
        result.endTime = java.lang.System.currentTimeMillis()
        
        if (!result.save(flush: true)) {
            render(view: "create", model: [sessionInstance: session])
            return
        }
        
        redirect(controller:"session", action:"show", id: params.sessionId)
        return
    }
}
