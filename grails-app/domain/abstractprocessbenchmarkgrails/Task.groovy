package abstractprocessbenchmarkgrails

class Task implements Comparable {
    
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
    
    public int compareTo(def other) {
        return sequence <=> other?.sequence // <=> is the compareTo operator in groovy
    }
}
