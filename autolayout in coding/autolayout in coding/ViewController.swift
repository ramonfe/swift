import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redBox : UIView = UIView(frame: CGRect.zero)
        redBox.backgroundColor = UIColor.red
        
        self.view.addSubview(redBox)
        redBox.translatesAutoresizingMaskIntoConstraints=false
        
        redBox.heightAnchor.constraint(equalToConstant: 200).isActive=true
        
        let redX = redBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        redX.isActive=true
        
        let redY = redBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        redY.isActive=true
        
        let widthConst = NSLayoutConstraint(item: redBox,
                                            attribute: NSLayoutConstraint.Attribute.width,
                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                            toItem: nil,
                                            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                            multiplier: 1.0, constant: 150.0)
        
        redBox.addConstraint(widthConst)
    }


}

