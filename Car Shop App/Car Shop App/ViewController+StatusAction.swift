import Foundation
import UIKit

extension ViewController
{
    @IBAction func StatusAction(_ sender: Any) {
        let idx = (sender as! UISegmentedControl).selectedSegmentIndex
        curArr = Array<Vehicle>()
        
        switch idx {
        case 0://available
            for anyVeh in Dummies.dummiesArr{
                if (anyVeh.status == VehicleState.available ){
                    curArr.append(anyVeh)
                }
            }
            showString(inpTitle: "Available", inpArray: curArr)
        case 1://out
            for anyVeh in Dummies.dummiesArr{
                if (anyVeh.status == VehicleState.out ){
                    curArr.append(anyVeh)
                }
            }
            showString(inpTitle: "Out", inpArray: curArr)
        case 2://repair
            for anyVeh in Dummies.dummiesArr{
                if (anyVeh.status == VehicleState.repairs ){
                    curArr.append(anyVeh)
                }
            }
            showString(inpTitle: "Repairs", inpArray: curArr)
        default:
            break
        }
    }
}
