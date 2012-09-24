package abstractprocessbenchmarkgrails

class System {

    String description
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
