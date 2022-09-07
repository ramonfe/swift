import UIKit

class Laptop
{
    var color:String = "Red"
}

var myLap = Laptop()
print("My Lap Color: \(myLap.color)")
var stollenLap = myLap
stollenLap.color = "blue"

print("stolen lap color: \(stollenLap.color)")
print("My lap color: \(myLap.color)")
