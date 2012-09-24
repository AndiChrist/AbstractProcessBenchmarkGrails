package abstractprocessbenchmarkgrails

class Session {

    Project project
    Process process
    Date startDate
    User owner
    String description
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
