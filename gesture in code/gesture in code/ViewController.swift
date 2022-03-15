import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myLongGEst = UILongPressGestureRecognizer(
            target: self,
            action: #selector(gestFunc))
        
        self.view.addGestureRecognizer(myLongGEst)
    }

    @objc func gestFunc()
    {
        print("gesture activated")
    }

}

