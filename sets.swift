import Foundation
//conjuntos
var mySet = Set<String>()
let mySet2: Set<String>=["uno","dos","tres","cuatro","uno"]
let mySet3: Set = ["uno","dos","tres","cuatro","uno"]
//insercion uno a uno
mySet.insert("ramon")
mySet.insert("felix")
mySet.insert("valle")
mySet.insert("ramon")
//print(mySet)
//acceso
if (mySet.contains("ramon")){print(true)}else {print("false")}
//modificacion
mySet.remove("valle")
//print(mySet)
//acceso y modificacion
if let index = mySet.firstIndex(of:"ramon"){
    mySet.remove(at:index)
}
//print(mySet)
//iterar
mySet.insert("carmen");mySet.insert("emi");mySet.insert("gene");mySet.insert("alex")
for item in mySet {
   // print(item)
}
//operaciones de conjunto
let myIntSet: Set = [1,2,3,4,5]
let myIntSet2: Set = [0,2,3,6,7]
//interseccion
print(myIntSet.intersection(myIntSet2))
//diferencia simetrica (valores no comunes)
print(myIntSet.symmetricDifference(myIntSet2))
//union
print(myIntSet.union(myIntSet2))
//sustraccion
print(myIntSet.subtracting(myIntSet2))









//iterar sets