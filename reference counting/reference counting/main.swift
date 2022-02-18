import Foundation

class Comment{
    var text = ""
    weak var owner : User? //like assign, dont copy
}
class User{
    var name = ""
    var comments:Comment!
    init(inName:String) {
        name=inName
        comments = Comment()
    }
}
var myUser = User(inName: "ramon")
print("user count: \(CFGetRetainCount(myUser))")
myUser.comments.owner = myUser
print("user count: \(CFGetRetainCount(myUser))")
