import Foundation

//void function
func myFunc() {
    print("void function")
}
//or void as 
func name() -> Void {
    print("explicit void function")
}

func myFunc2(num1:Int,num2:Int) -> Int
{
    let res = num1*num2
   // print("result is \(res)")
    return res
}
//function with more than one value
func fResManyVals(parInt:Int)-> (Bool,numero:Int)
{
    var resBool = true
    var resInt = parInt
    if (parInt < 0)
    {
        resBool = false;
        resInt *= -1
    }
    return(resBool,resInt)
}
myFunc()
name()
print(myFunc2(num1: 8,num2:5))
let myInt = -5
let state = fResManyVals(parInt:myInt).0//called with an index
let posNum = fResManyVals(parInt:myInt).numero//or called with a name
print("\(myInt) was \(state) and now is \(posNum)")

//nested functions
func funcOne(){
    func nestedFunc()
    {
        print("printed form inside")
    }
    nestedFunc()
}
funcOne()


