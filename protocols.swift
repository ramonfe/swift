import Foundation
//like a contract in C#
protocol myProtocol{
    var active:Bool {get set}
    var uid:String{set get}
    var rate:Float{get}
    
    func rateIt(iRate:Float)
}

class Class1:myProtocol{
    var active:Bool 
    var uid:String
    var rate:Float
    
    func rateIt(iRate:Float)
    {}

    init(iActive:Bool) {
        active=iActive
        uid=UUID().uuidString
        rate=0.0
    }
    
}