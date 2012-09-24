package abstractprocessbenchmarkgrails

class Process {

    String alias
    String description
    
    static constraints = {
    }    
    
    String toString(){
        return "${alias}: ${description}"
    }
    
}
