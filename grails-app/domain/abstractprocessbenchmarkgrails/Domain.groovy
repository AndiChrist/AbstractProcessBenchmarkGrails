package abstractprocessbenchmarkgrails

class Domain {

    String name
    
    static hasMany = [processes:Process]   
    
    static constraints = {
    }
    
    String toString(){
        return "${name}"
    }
}
