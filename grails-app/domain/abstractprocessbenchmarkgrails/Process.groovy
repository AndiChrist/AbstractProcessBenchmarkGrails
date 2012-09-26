package abstractprocessbenchmarkgrails

class Process {

    String alias
    String description
    Domain domain
    
    static hasMany = [tasks:Task, sessions:Session]    
    
    static belongsTo = [domain:Domain]
    
    static constraints = {
    }    
    
    String toString(){
        return "${alias}: ${description}"
    }
    
}
