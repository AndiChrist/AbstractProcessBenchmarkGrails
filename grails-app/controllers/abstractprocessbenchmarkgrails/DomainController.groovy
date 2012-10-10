package abstractprocessbenchmarkgrails

class DomainController {

    static scaffold = true

    def beforeInterceptor = [action:this.&auth]
   
    def index() {
        redirect(action: "list")
    }
    
    // go to login page if session has no user
    def auth() {
        if(!session.user) {
            redirect(controller:"user", action:"login")
            return false
        }
    }
}
