import Foundation
import UIKit

extension UIColor
{
    var name:String?
    {
        switch self {
        case UIColor.black:return "Black"
            case UIColor.red:return "Red"
            case UIColor.blue:return "Blue"
            case UIColor.yellow:return "Yellow"
            case UIColor.cyan:return "Cyan"
        default:return nil
        }
    }
}
