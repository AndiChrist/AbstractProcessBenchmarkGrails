package abstractprocessbenchmarkgrails

class Result {

    int duration
    Task task
    Session session
    //static belongsTo = Session
    
    static constraints = {
    }
}
