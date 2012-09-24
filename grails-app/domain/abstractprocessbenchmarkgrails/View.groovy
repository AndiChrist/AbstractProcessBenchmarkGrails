package abstractprocessbenchmarkgrails

class View {

    String description
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
