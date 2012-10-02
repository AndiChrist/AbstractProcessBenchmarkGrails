package abstractprocessbenchmarkgrails

class Task {
    
    Process process
    int sequence
    //    Layer layer1
    //    Layer layer2
    //    Layer layer3
    Role role
    User taskOwner
    System system
    Media media
    View view
    String description
    
    static hasMany = [results:Result]   
    
    String toString(){
        return "${description} (${sequence})"
    }
    
//    static mapping = {
//        sort "sequence"
//    }     
}
