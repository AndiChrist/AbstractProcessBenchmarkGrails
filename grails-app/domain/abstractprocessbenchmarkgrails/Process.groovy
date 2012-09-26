package abstractprocessbenchmarkgrails

class Process {

    String alias
    String description
    
    static hasMany = [tasks:Task]    
    
    static constraints = {
    }    
    
    String toString(){
        return "${alias}: ${description}"
    }
    
}
