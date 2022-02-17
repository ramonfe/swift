import UIKit

class ViewController: UIViewController,UISearchTextFieldDelegate
{

    @IBOutlet weak var myTextFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTextFld.delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

}

