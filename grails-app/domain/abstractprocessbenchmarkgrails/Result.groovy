package abstractprocessbenchmarkgrails

class Result {

    Long startTime
    Long endTime
    Task task
    Session session
    //static belongsTo = Session
    
    static constraints = {
    }
}
