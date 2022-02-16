import Foundation

class User
{
    
    var name : String!
    var uid: String!
    
    init(iName:String,iUid:String) {
        self.name=iName
        self.uid=iUid
    }
    
    convenience init?(iDict:Dictionary<String,Any>)
    {
        guard
            let readName=iDict["nameKey"] as? String,
            let readUid=iDict["uid"] as? String
        else
        {
            return nil
        }
        self.init(iName:readName,iUid:readUid)
    }
    
}
var userId = ["nameKeys":"Ramon","uuid":"asdad234234234"]

var user = User(iDict: userId)
var user2 = User(iName: "Carmen", iUid: "345678")
print("\(user?.name) y \(user2.name)")

