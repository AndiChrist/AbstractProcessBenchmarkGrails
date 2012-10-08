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
            tested = tested.or(it?.endTime - it?.startTime > 0)
        }
        return tested
    }
    
    boolean hasAnyUntested() {
        if (results == null)
            return false
            
        if (results?.size() == 0)
            return false
            
        boolean tested = true

        results?.each() { 
            tested = tested.and(it?.endTime - it?.startTime > 0)
        }
        return tested
    }
}
