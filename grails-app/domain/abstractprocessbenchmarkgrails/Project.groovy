package abstractprocessbenchmarkgrails

class Project {
    
    Date creationDate
    User owner
    String description

    static constraints = {
    }
    
    String toString(){
        return "${description} (${owner})"
    }
}
