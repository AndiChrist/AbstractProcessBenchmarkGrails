package abstractprocessbenchmarkgrails

class Result {

    Long startTime
    Long endTime
    Task task
    Session session
    
    static constraints = {
    }
    
    // show durations of results, if available
    String toString(){
        def output = session.description + ": "
        
        def duration = (endTime ?: 0) - (startTime ?: 0)
        if (duration > 0) {
            output += (duration / 1000) + " sec."
        } else if (duration < 0) {
            output += " in progess..."
        } else {
            output += " ungetestet"
        }
            
        return "${output}"
    }
    
    boolean isTesting() {
        return (endTime - startTime < 0)
    }
    
    boolean isTested() {
        return (endTime - startTime > 0)
    }
    
    boolean isUntested() {
        return (endTime - startTime == 0)
    }
    
}
