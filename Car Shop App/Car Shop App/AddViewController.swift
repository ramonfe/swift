import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var txtvName: UITextField!
    @IBOutlet weak var txtvColor: UITextField!
    @IBOutlet weak var txtvMaxGear: UITextField!
    @IBOutlet weak var txtStatus: UITextField!
    
    @IBOutlet weak var warningLabel: UILabel!
    var selectedType:String!
    var newVehDict=Dictionary<String,Any>()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newVehDict["nameKey"]=txtvName.text
        txtvName.resignFirstResponder()
        return true
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtvName.delegate=self
    }
    @IBAction func addCar(_ sender: Any)
    {        
        if (!validate())
        {
            return
        }
        var newVehicle:Vehicle!
        if (selectedType == "Sedan"){
            newVehicle = Sedan(inpDict: newVehDict)
            Dummies.dummiesArr.append(newVehicle!)
        }
        else if (selectedType=="Truck")
        {
            
        }
        //para que se regrese a la ventana padre
        self.dismiss(animated: true, completion: nil)
    }
    func cleanElements()
    {
        txtvName.text=""
        txtvColor.text=""
        txtvMaxGear.text=""
        txtStatus.text=""
    }
    func validate()->Bool
    {
        if (selectedType==nil || newVehDict.values.count<2){
            warningLabel.isHidden=false
            warningLabel.text = "Ponlos todos papa"
            return false
        }
        else{
            warningLabel.isHidden=true
            return true
        }
    }
    @IBAction func changeStatus(_ sender: Any)
    {
        let selIdx = (sender as! UISegmentedControl).selectedSegmentIndex
        newVehDict["statusKey"] = "\(VehicleState(rawValue: selIdx)!)"
    }
    
    @IBAction func changeType(_ sender: Any)
    {
        let selIdx = (sender as! UISegmentedControl).selectedSegmentIndex
        switch selIdx {        
        case 0:
            selectedType="Sedan"
        default:
            selectedType="Truck"
        }
    }
}
