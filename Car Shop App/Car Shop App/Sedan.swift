import UIKit

class Sedan: Vehicle {
    var curGear:Int=0
    
    convenience init?(inpDict:Dictionary<String,Any>)
    {
        guard let name = inpDict["nameKey"] as? String,
        let gears = inpDict["gearKey"] as? Int,
        let colorStr = inpDict["colorKey"] as? String,
        let statusStr = inpDict["statusKey"] as? String
        else{
            return nil
        }
        var status = VehicleState.available
        
        for anyCase in VehicleState.allCases
        {
            if ("\(anyCase)" == statusStr)
            {
                status=anyCase
            }
        }
        self.init(iName:name,
                  iColor:UIColor.red,
                  iMaxGear:gears,
                  iStatus:status)
        
    }
}
