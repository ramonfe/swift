import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var lblCount: UILabel!
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool
    {
        // to determin if text are legal and should
        //get the text brak it by character
        //join them. if no change..then is ok
        var alphaNum = CharacterSet.alphanumerics // doesnt include space
        alphaNum.insert(" ")
        let charSet = alphaNum.inverted
        let filteredText = text.components(separatedBy: charSet).joined(separator: "")
        if (text=="" && range.length>0)
        {
            return true
        }
        
        if (filteredText == text && txtView.text.count < 140)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func textViewDidChange(_ textView: UITextView)
    {
        //well they have be entered, what to do with it
        let currentCount = txtView.text.count
        lblCount.text = String (currentCount)
        let red = CGFloat (currentCount)/140.0
        let green = 1-red
        
        let newBg = UIColor(displayP3Red: red, green: green, blue: 0.0, alpha: 1.0)
        lblCount.backgroundColor = newBg
    }


}

