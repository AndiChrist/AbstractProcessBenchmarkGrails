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
    
    // all Results are tested (session is READY)
    boolean isTested() {
        if (results == null)
            return false
            
        if (results?.size() == 0)
            return false
            
        boolean tested = true
        results.each() { 
            tested = tested.and(it.isTested())
        }
        return tested
    }
    
    // is there any untested result left?
    boolean isTesting() {
        if (results == null)
            return false
            
        if (results?.size() == 0)
            return false
            
        boolean untested = false

        results?.each() { 
            untested = untested.or(it.isTesting())
        }
        return untested
    }
    
    // if no result in in testing progress (completely untested)
    boolean isUntested() {
        if (results == null)
            return true
            
        if (results?.size() == 0)
            return true
            
        boolean progress = true
        
        results.each() { 
            progress = progress.and(it.isUntested())
        }
        
        return progress
    }
    
    def testingRate() {
        if (results == null)
            return null
            
        if (results?.size() == 0)
            return null
            
        int countTested = 0
        int countTesting = 0
        int countUntested = 0
        
        results.each() { 
            if (it.isTested()) countTested++
            if (it.isTesting()) countTesting++
            if (it.isUntested()) countUntested++
        }
        
        [
            countTested:countTested, 
            countTesting:countTesting, 
            countUntested:countUntested,
        ]
    }
    
    def progress() {
        def size = results.size() 
        def rate = (((size > 0) ? testingRate()?.countTested / size : 0) * 100) as Integer
        
        return rate
    }
    
    def durations() {
        def durations = []
        results.each { 
          def d = it.endTime - it.startTime 
          if (d > 0)
            durations << d
        }
        
        return durations
    }
}
