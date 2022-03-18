import Foundation

func swapTwoGenerics<A>(a: inout A,b:inout A){
    let tempA = a
    a=b
    b=tempA
}

var fstGeneric = "Ramon"
var scnGeneric = "Felix"
print ("El primer valor es:\(fstGeneric) y el segundo valor es: \(scnGeneric)")
swapTwoGenerics(a: &fstGeneric,b: &scnGeneric)
print ("El primer valor es:\(fstGeneric) y el segundo valor es: \(scnGeneric)")