import Foundation

class User
{
    var name:String
    var lastName:String
    var height:Int
    var eyeColor:String
    var active:Bool
    
    init(inpName:String,
         inpLastName:String,
         inpHeight:Int,
         inpEyeColor:String,
         inpActive:Bool)
    {
        name = inpName
        lastName = inpLastName
        height = inpHeight
        eyeColor = inpEyeColor
        active = inpActive
    }
}
