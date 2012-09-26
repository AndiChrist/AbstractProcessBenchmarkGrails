package abstractprocessbenchmarkgrails

class Role {
    
    String description
    
    static hasMany = [users:User]

    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
