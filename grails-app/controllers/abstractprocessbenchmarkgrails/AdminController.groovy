package abstractprocessbenchmarkgrails

class AdminController{
    def beforeInterceptor = [action:this.&auth]
    
    // any actions as "admin" is for admins only
    def auth() {
        if(!session.user) {
            redirect(controller:"user", action:"login")
            return false
        }
        if(!session.user.admin){
            flash.message = "Tsk tsk—admins only"
            redirect(controller:"session", action:"list")
            return false
        }
    }
    def index = {} // do nothing, just display admin/index.gsp
}