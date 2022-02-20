import UIKit

class Vehicle {
    var name:String!
    var color:UIColor
    var maxGear:Int!
    var status:VehicleState!
    
    init(iName:String,iColor:UIColor,iMaxGear:Int,iStatus:VehicleState) {
        name=iName
        color=iColor
        maxGear=iMaxGear
        status=iStatus
    }
}
