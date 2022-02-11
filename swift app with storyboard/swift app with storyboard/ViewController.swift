import UIKit

class ViewController: UIViewController
{
    //all the outlets here
    
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBOutlet weak var mylabel: UILabel!
    
    
    @IBAction func myButtonAction(_ sender: Any)
    {
        mylabel.backgroundColor = UIColor.orange
        mylabel.textColor = UIColor.black
        mylabel.textAlignment = NSTextAlignment.center
        mylabel.font = UIFont.systemFont(ofSize:  30)
        mylabel.text = "Hited"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myButton.backgroundColor = UIColor.darkGray
        myButton.setTitle("Hit me", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
    }


}

