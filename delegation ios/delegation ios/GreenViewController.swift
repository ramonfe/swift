import UIKit

class GreenViewController: UIViewController
{
    var delegate : sendingMessageDelegate!
    
    @IBOutlet weak var msgTextField: UITextField!
    @IBAction func goBackAction(_ sender: Any)
    {
        let textToSend = msgTextField.text!
        //we have to do something
        delegate.send(message: textToSend)
        
        self.dismiss(animated: true, completion: nil)
    } 
   
}
