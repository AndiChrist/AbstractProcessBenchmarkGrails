package abstractprocessbenchmarkgrails

class Layer {

    String description
    int level

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
