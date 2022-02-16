import Foundation

class Building:NSObject{
     func locate() {}
     func lightsOn(){}
}
class Car:NSObject{
     func locate(){}
     func changeGear(){}
}
class Person:NSObject{
     func locate(){}
     func eat(){}
}
let building = Building()
let car = Car()
let person = Person()

var objArray: Array<Any> = [building,car,person]
/*
for item in objArray {
    if (item.respondsToSelector(Selector("eat"))) {
         print(item)
    }   
}
*/
if let canEat = objArray[0].eat?()
{ 
    print("is a person")
}
else
{
    print("not found")
}


