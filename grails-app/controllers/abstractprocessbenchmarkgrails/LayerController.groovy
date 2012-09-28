package abstractprocessbenchmarkgrails

class LayerController {

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
}
