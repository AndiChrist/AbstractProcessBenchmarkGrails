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

//    def filterPaneService
//    
//    def filter = {
//        if(!params.max) params.max = 10
//        render( view:'list',
//            model:[ ${propertyName}List: filterPaneService.filter( params, ${className} ),
//                ${propertyName}Total: filterPaneService.count( params, ${className} ),
//                filterParams: org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params),
//                params:params ] )
//    }
}
