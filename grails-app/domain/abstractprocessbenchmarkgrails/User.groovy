package abstractprocessbenchmarkgrails

class User {
    
    String login
    String firstName
    String lastName
    String password
    Role role

    // m:n relation to Domain
    static hasMany = [domains: Domain]
    static belongsTo = Domain

    static constraints = {
        login(blank:false, nullable:false, unique:true)
        password(blank:false, password:true)
        lastName()
        //role(inList:["admin", "user"])
    }
    
    static transients = ['admin']
    
    boolean isAdmin(){
        return role.description == Role.ADMIN
    }

    String toString(){
        login
    }

}
