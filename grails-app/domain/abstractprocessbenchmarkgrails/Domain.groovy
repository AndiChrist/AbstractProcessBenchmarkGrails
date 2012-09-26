package abstractprocessbenchmarkgrails

class Domain {

    String name
    
    static hasMany = [processes:Process, users:User]   
    
    static constraints = {
    }
    
    String toString(){
        return "${name}"
    }
}
