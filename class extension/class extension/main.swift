//Extiende una clase con mas metodos
import Foundation

class MyClass
{
    let myStr : String=""
    func some(){}
}
extension MyClass{
    func otherSome()
    {}
}
//extending the string system class
extension String
{
    //numbers only
    func numbersOnly() -> String
    {
        let numbers = "0123456789"
        let removeCharset = NSCharacterSet(charactersIn: numbers).inverted
        let separated = self.components(separatedBy: removeCharset)
        let joinChar = separated.joined(separator: "")
        return joinChar
    }
}

let foo = MyClass()
foo.some()
var myStr:String = "asd686asd8as76ad876s09da0s9d8"
print("numbers only:\(myStr.numbersOnly())")
