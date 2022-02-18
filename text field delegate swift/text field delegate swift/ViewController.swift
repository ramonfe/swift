import UIKit

class ViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet weak var myTextFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTextFld.delegate=self
        myTextFld.keyboardType = UIKeyboardType.numberPad
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let numbers = "0123456789"
        let removeCharset = NSCharacterSet(charactersIn: numbers).inverted
        //divide
        let separated = string.components(separatedBy: removeCharset)
        //join
        let joinChar = separated.joined(separator: " ")
        
        return (string == joinChar)
        
    }
}

