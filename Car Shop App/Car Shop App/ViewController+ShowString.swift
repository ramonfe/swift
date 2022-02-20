import Foundation
import UIKit

extension ViewController
{
    func showString(inpTitle:String, inpArray:Array<Vehicle>)
    {
        var toShowStr = inpTitle
        
        toShowStr.append("\n")
        
        for eachVehicle in inpArray{
            toShowStr.append("\n\t")
            toShowStr.append(eachVehicle.name.uppercased())
            toShowStr.append("\n\t\t")
            toShowStr.append("Color: \(eachVehicle.color.name!)")
            toShowStr.append("\n\t\t")
            toShowStr.append("Max Gear: \(String(eachVehicle.maxGear!))")
            toShowStr.append("\n\t\t")
            toShowStr.append("Status: \(eachVehicle.status!)")
            toShowStr.append("\n")
        }
        resTextView.text = toShowStr
    }
}
