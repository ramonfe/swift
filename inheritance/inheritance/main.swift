import Foundation

//class of vehicles
//subclass called sedan
//override functions
//add new fucntions

class Vehicle
{
    var tires: Int!
    
    init(iTires:Int) {
        self.tires=iTires
    }
    
    func carryWeight(iWeight:Int) -> Bool {
        return false
    }
}

class Sedan:Vehicle{
    var sunRoof:Bool!
    
    override func carryWeight(iWeight: Int) -> Bool {
        if (iWeight<200){
            return true
        }
        else{
            return false
        }
    }
    
    override init(iTires: Int) {
        super.init(iTires: iTires)
        self.sunRoof=false
    }
    
    init(iSunRoof: Bool) {
        super.init(iTires: 4)
        self.sunRoof=iSunRoof
    }
}

var nissan = Sedan(iSunRoof: false)
print(nissan.carryWeight(iWeight: 199))
