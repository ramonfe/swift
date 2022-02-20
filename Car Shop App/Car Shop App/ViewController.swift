import UIKit

class ViewController: UIViewController {
    var curArr : Array<Vehicle>!
    @IBOutlet weak var resTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        Dummies.populateArr()
    }    
    
    @IBAction func btnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddSegue", sender: nil)
    }
    

}

