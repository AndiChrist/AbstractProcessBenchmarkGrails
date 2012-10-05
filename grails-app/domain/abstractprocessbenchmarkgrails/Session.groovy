package abstractprocessbenchmarkgrails

class Session {

    Process process
    Date startDate
    User sessionOwner
    String description
    
    //static hasMany = [sessionOwners:User]   
    static hasMany = [results:Result]  
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
    
    boolean isTested() {
        boolean tested = false
        results.each() { 
            tested = tested.or(it?.duration > 0)
        }
        return tested
    }
}
