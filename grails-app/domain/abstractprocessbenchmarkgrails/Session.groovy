package abstractprocessbenchmarkgrails

class Session {

    Process process
    Date startDate
    User sessionOwner
    String description
    
    //static hasMany = [sessionOwners:User]   
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
}
