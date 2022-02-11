import Foundation

var stringArray : Array<String> = ["hello","world"]
print(stringArray)
stringArray.append("mundo")
print(stringArray)
print("count array : \(stringArray.count)")

stringArray.remove(at:1)
print(stringArray)

if let index = stringArray.index(of:"mundso") 
{
    print("mundo is at index:\(index)")
}
else
{
    print("not found miundo")
}


