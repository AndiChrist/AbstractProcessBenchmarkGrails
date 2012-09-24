package abstractprocessbenchmarkgrails

class Service {

    String description
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
