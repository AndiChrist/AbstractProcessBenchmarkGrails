package abstractprocessbenchmarkgrails

class Role {
    static final String ADMIN = 'Admin' 
    static final String USER = 'User' 
    
    String description
    
    static hasMany = [users:User]

    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
