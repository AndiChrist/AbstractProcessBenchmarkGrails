package abstractprocessbenchmarkgrails

class Layer {

    String description
    int level
 
    // since Layers are not needed in the current stage of development, these experimental lines of code are commented out
//    static hasMany = [ subordinates: Layer ]
//    static belongsTo = [ parent: Layer ]
//    static transients = ['allSubordinates']
//    def getAllSubordinates() {
//        return subordinates ? subordinates*.allSubordinates.flatten() + subordinates : []
//    }
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }    
}
