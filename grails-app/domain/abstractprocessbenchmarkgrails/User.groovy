package abstractprocessbenchmarkgrails

class User {
    
    String alias
    String firstName
    String lastName

    static constraints = {
    }
    
    String toString(){
        return "${lastName}, ${firstName}"
    }
}
