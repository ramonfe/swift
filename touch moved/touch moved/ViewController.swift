
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redBox: UIView!
    var tapOffset:CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if (touches.count==1)
        {
            let myTouch = touches.first
            if (myTouch?.view == redBox)
            {
                //where we tap in the redbox
                let locInRed = (myTouch?.location(in: redBox))!
                //the middle of the red box
                let redMiddle = CGPoint(x: redBox.frame.size.width/2,
                                        y: redBox.frame.size.height/2)
                //the difference between them
                let xDif = redMiddle.x - locInRed.x
                let yDif = redMiddle.y - locInRed.y
                //
                tapOffset = CGPoint(x: xDif, y: yDif)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if (touches.count==1)
        {
            let myTouch = touches.first
            if (myTouch?.view == redBox){
                let locInView :CGPoint = (myTouch?.location(in: self.view))!
                
//                let combinedValue = CGPoint(x: locInView.x+tapOffset.x,
//                                            y: locInView.y+tapOffset.y)
                redBox.center = locInView + tapOffset
            }
        }
    }
}
func +(fstLoc: CGPoint, scndLoc:CGPoint) -> CGPoint
{
    return CGPoint(x: fstLoc.x+scndLoc.x, y: fstLoc.y+scndLoc.y)
}
