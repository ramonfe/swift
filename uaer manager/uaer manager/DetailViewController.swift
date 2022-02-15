
import UIKit

class DetailViewController: UIViewController {

    var usersString = ""
    
    @IBOutlet weak var some: UIButton!
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var txtVList: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        txtVList.text = "Users Are:\n\n" + usersString
    }
    
}
