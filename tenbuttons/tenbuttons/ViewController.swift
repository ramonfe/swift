import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margin : CGFloat=16.0
        let height : CGFloat=(self.view.frame.height-(20+11*margin))/10
        
        for i in 0..<10
        {
            let myFrame = CGRect(x: margin,
                                 y: 20+margin + CGFloat(i) * (height+margin),
                                 width: self.view.bounds.size.width-margin*2,
                                 height: height)
            
            let myButton = UIButton(frame: myFrame)
            myButton.backgroundColor = UIColor.red
            self.view.addSubview(myButton)
        }
    }


}

