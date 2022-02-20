import Foundation
import UIKit

class Dummies {
    static var dummiesArr:Array<Vehicle>!
    
    class func populateArr(){
        dummiesArr = Array<Vehicle>()
        
        let veh_1 = Sedan(iName: "Corolla", iColor: UIColor.red ,
                          iMaxGear: 4, iStatus: VehicleState.out)
        
        let veh_2 = Sedan(iName: "Ford", iColor: UIColor.blue ,
                          iMaxGear: 5, iStatus: VehicleState.available)
        
        let veh_3 = Sedan(iName: "Fiat", iColor: UIColor.yellow ,
                          iMaxGear: 5, iStatus: VehicleState.repairs)
        
        let veh_4 = Truck(iName: "Dodge", iColor: UIColor.cyan ,
                          iMaxGear: 4, iStatus: VehicleState.available)
        
        dummiesArr.append(veh_1)
        dummiesArr.append(veh_2)
        dummiesArr.append(veh_3)
        dummiesArr.append(veh_4)
    }
}
