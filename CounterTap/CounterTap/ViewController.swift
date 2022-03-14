import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    var curTime :Int!
    var timer:Timer!
    var count:Int!
    var play = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapView.isUserInteractionEnabled = true
        count=0
        curTime=0
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(countTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.count==1 && play)
        {
            let myTouch = touches.first
            if (myTouch?.view == tapView)
            {
                count+=1
                lblCount.text = "\(count!)"
            }
        }
    }
    @objc func countTime()
    {
        if (curTime <= 10)
        {
            lblTimer.text = "\(curTime!)"
            curTime += 1
        }
        else
        {
            play = false
            timer.invalidate()
        }
    }
}

