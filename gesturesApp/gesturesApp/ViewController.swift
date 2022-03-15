import UIKit

class ViewController: UIViewController
{
    @IBOutlet var myGestureAction: UITapGestureRecognizer!
    
    @IBAction func myGestureAct(_ sender: Any)
    {
        if let myRotGest = (sender as? UIRotationGestureRecognizer)
        {
            print("Scale is:\(myRotGest.rotation)")
        }
        
    }
}

