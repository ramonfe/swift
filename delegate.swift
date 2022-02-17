import Foundation
 //Delegation pattern to send messages within classes
protocol sendMessageDelegate{
    func sendMessage(message:String)
}
class Friend:sendMessageDelegate
{
    var name:String!
    init(iName:String) {
        name=iName
    } 
     func sendMessage(message:String){
         print("\(name) has received :\(message)")
     }   
}
class User{
    var name:String!
    init(iName:String) {
        name=iName
    }  
    var delegate: sendMessageDelegate! //variable of type protocol
}
//mission: Our user to send a message to a friend
var jake = Friend(iName:"Vale")
var myUser = User(iName:"ramon")
myUser.delegate = jake
myUser.delegate.sendMessage(message:"message: Hi from: \(myUser.name!) ");