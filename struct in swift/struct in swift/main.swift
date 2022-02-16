import Foundation

//structs cannot have inherance
//structs pass the value, classes pass the pointer
//structs are a lot faster

//Advice: Use structs unless you need a class

struct User {
    var Name:String!
    var uid:String!
    
    init(iName:String,iUid:String) {
        self.Name=iName
        self.uid=iUid
    }
}

