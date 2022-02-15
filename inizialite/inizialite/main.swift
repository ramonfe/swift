import Foundation

class User:  {
    let email : String
    var name : String
    
    var rate:Float = 0.0
    
    var uid : String!
    var photo : String?
    
    
    init(inpUid: String,inpName:String ) {
        uid = inpUid
        name = inpName
    }
    init(inpUid: String,inpName:String,inpPhoto:String ) {
        uid = inpUid
        name = inpName
        photo = inpPhoto
    }
}

var user = User(inpUid: "123", inpName: "Ramon")
var user2 = User(inpUid: "456", inpName: "CArmen", inpPhoto: "somephoto")

