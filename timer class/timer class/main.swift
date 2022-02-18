import Foundation

class myClass
{
    //function to trigger a timer
    func runTimer(){
        Timer.scheduledTimer(timeInterval: 0.001,
                             target: self,
                             selector: #selector(printTime),
                             userInfo: nil,
                             repeats: true)
    }

    //function that calls a timer
    @objc func printTime(){
        print("HI")
    }
}
var myObj = myClass()
myObj.runTimer()
