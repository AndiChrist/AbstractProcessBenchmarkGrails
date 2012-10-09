package abstractprocessbenchmarkgrails

class Process {

    String alias
    String description
    Domain domain
    
    static hasMany = [tasks:Task, sessions:Session]    
    
    static belongsTo = [domain:Domain]
    
    // sorting of tasks by sequence numbers
    static fetchMode = [tasks: "eager"]
    static mapping = {
        tasks sort:'sequence'
    }

    static constraints = {
    }    
    
    String toString() {
        return "${alias}: ${description}"
    }
}
