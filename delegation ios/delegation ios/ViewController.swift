import UIKit

class ViewController: UIViewController, sendingMessageDelegate
{
    func send(message:String)
    {
        receiveMessageLabel.text = message
        
    }
    
    @IBOutlet weak var receiveMessageLabel: UILabel!
    
    @IBAction func GoGreenAction(_ sender: Any)
    {
        self.performSegue(withIdentifier: "GreenSegueId", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greenInstance = segue.destination as! GreenViewController
        
        greenInstance.delegate = self
    }
}

