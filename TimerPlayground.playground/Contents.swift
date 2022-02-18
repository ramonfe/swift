import Cocoa

class myClass
{
    var time : Float = 0.0
    func runTimer(){
        Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(printTime),
                             userInfo: nil,
                             repeats: true)
    }

    //function that calls a timer
    @objc func printTime (){
        time += 0.1
        print(String(format:"%.2f",time))
    }
}
var myObj = myClass()
myObj.runTimer()
