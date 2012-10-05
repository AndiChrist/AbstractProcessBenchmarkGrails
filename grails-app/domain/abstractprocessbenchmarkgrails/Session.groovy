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
    
    boolean hasAnyUntested() {
        println("r: " + results)
        if (results == null)
            return false
            
        if (results?.size() == 0)
            return false
            
        boolean tested = true

        results?.each() { 
            println("t: " + tested)
            tested = tested.and(it?.duration > 0)
        }
        println("return: " + tested)
        return tested
    }
}
