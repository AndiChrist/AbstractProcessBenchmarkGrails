package abstractprocessbenchmarkgrails

class Session {

    Process process
    Date startDate
    User sessionOwner
    String description
    
    // 1:n relation to Result 
    static hasMany = [results:Result]  
    
    static constraints = {
    }
    
    String toString(){
        return "${description}"
    }
    
    // if any result is "tested" the session itself is in a "tested" state
    boolean isTested() {
        boolean tested = false
        results.each() { 
            tested = tested.or(it?.endTime - it?.startTime > 0)
        }
        return tested
    }
    
    // is there any untested result left?
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
