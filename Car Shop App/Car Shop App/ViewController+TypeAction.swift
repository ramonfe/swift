import Foundation
import UIKit

extension ViewController
{
    @IBAction func typeAction(_ sender: Any) {
        let idx = (sender as! UISegmentedControl).selectedSegmentIndex
        curArr = Array<Vehicle>()
        
        switch idx {
        case 0://sedan
            for anyVeh in Dummies.dummiesArr{
                if let thisSedan = anyVeh as? Sedan {
                    curArr.append(thisSedan)
                }
            }
            showString(inpTitle: "Sedans", inpArray: curArr)
        case 1://truck
            for anyVeh in Dummies.dummiesArr{
                if let thisTruck = anyVeh as? Truck {
                    curArr.append(thisTruck)
                }
            }
            showString(inpTitle: "Trucks", inpArray: curArr)
        default:
            break
        }
    }
}
