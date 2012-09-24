package abstractprocessbenchmarkgrails

class Task {
    
    Session session
    int sequence
    Layer layer1
    Layer layer2
    Layer layer3
    Role role
    User user
    System system
    Media media
    View view
    String description
    int duration
    

//    static constraints = {
//        layer1(level:1)
//        layer2(level:2)
//        layer3(level:3)
//    }
    
    String toString(){
        return "${description} (${sequence})"
    }
}
