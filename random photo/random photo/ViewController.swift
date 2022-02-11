import UIKit

class ViewController: UIViewController
{
    let myArr = [
        "birds.jpg","cat.jpg","elepant.jpg","eye.jpg","park.jpg"]
    var myCurrArr:Array <String> = []
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myImgView: UIImageView!
    
    @IBAction func myButtonAct(_ sender: Any)
    {
        if (myCurrArr.count==0){
            myCurrArr=myArr
        }
        let idx = Int(arc4random()) % myCurrArr.count //value between 0..4
        myImgView.image = UIImage(named: myCurrArr[idx])
        myCurrArr.remove(at: idx)
        
    }
}

