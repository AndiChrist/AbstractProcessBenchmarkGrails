package abstractprocessbenchmarkgrails

class Role {
    
    String description

    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
