import UIKit

protocol Person{
    var name:String { get set }
    var age:Int { get set }
    func fullName() -> String
}
struct Programmer:Person{
    var name: String
    var age: Int
    var language:String
    func fullName() -> String {
        return "El nombre es \(name), edad:\(age) y su lenguaje es: \(language)"
    }
}
struct Teacher:Person{
    var name: String
    var age: Int
    var subject:String
    func fullName() -> String {
        return "El nombre es \(name), edad:\(age) e imparte la materia de: \(subject)"
    }
}
let myProgrammer = Programmer(name: "Ramon", age: 48, language: "Swift")
let myTeacher = Teacher(name: "Ramon", age: 48, subject: "Programacion")

print(myProgrammer.fullName())
print(myTeacher.fullName())

//protocolo delegado, comunicacion de ida y vuelta entre 2 clases
class FirstClass: SecondClassProtocol{
    func callSecond(){
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
    func call() {
        print("regrese")
    }
}
protocol SecondClassProtocol{
    func call()
}
class SecondClass{
    var delegate:SecondClassProtocol?
    
    func callFirst(){
        sleep(5)
        delegate?.call()
    }
}

let firstClass = FirstClass()
firstClass.callSecond()
