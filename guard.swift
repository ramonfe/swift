import Foundation

var optional1 : String? = "hello"
var optional2 : String? = "world"

func myGuard()->String,Int
{ 
    //only is exceuted if the variables are not null una despues de la otra
    //
guard 
    let op1 = optional1 as? String,
    let op2 = optional2 as? String

 else {
    return 
}
print("\(op1) and \(op2)")
}

myGuard()
