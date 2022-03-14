import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewObj: UIView!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch landed")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let myTouch = touches.first
        
        if (myTouch?.view == viewObj)
        {
            viewObj.removeFromSuperview()
            print("view was removed")
        }
    }

}

