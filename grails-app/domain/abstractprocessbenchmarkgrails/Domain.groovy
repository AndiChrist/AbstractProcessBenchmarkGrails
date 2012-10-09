package abstractprocessbenchmarkgrails

class Domain {

    // name of Domain
    String name
    
    // relation 1:n to Process and Users (Users is in fact a "m:n" relationship)
    static hasMany = [processes:Process, users:User]
    
    static constraints = {
    }
    
    String toString(){
        return "${name}"
    }
}
