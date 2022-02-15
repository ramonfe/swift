import UIKit

class ViewController: UIViewController {
    var allUsers: String = ""
    

    @IBOutlet weak var txtvName: UITextField!
    @IBOutlet weak var txtvHight: UITextField!
    @IBOutlet weak var txtvCity: UITextField!
    @IBOutlet weak var txtvPhone: UITextField!
    
    @IBAction func btnSubmit(_ sender: Any) {
        saveData()
        cleanTxts()
    }
    
    @IBAction func btnAllUsers(_ sender: Any)
    {
        self.performSegue(withIdentifier: "segueUserDetail", sender: allUsers)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "segueUserDetail")
        {
            let dvcInstance:DetailViewController  = segue.destination as! DetailViewController
            dvcInstance.usersString = allUsers
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func saveData()
    {
        allUsers.append("\tName: \(txtvName.text!)\n")
        allUsers.append("\tHight: \(txtvHight.text!)\n")
        allUsers.append("\tCity: \(txtvCity.text!)\n")
        allUsers.append("\tPhone: \(txtvPhone.text!)\n\n")
        allUsers.append("-------------------\n")
    }
    func cleanTxts()
    {
        txtvName.text=""
        txtvHight.text=""
        txtvCity.text=""
        txtvPhone.text=""
    }

}

