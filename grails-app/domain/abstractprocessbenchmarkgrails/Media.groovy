package abstractprocessbenchmarkgrails

class Media {
    
    String description

    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
