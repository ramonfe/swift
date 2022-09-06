import UIKit

var greeting = "Hello, playground"

func PlusMinus(arr: [Int]){
    
    var cPos = 0.0
    var cNeg = 0.0
    var cZero = 0.0
    let aLength = Double(arr.count)
    
    for i in arr{
        if (i < 0){
            cNeg += 1
        }
        else if i > 0{
            cPos += 1
        }else{
            cZero += 1
        }
    }
    print("Positive \(String(format: "%.4f", (cPos / aLength)))")
    print("Positive \(cNeg / aLength)")
    print("Positive \(cZero / aLength)")
}
//PlusMinus(arr: [1,3,4,-1,-6,8,0,34,2,-8])
//linear search (max value) best O1 worst On
func LinearSeach(arr: [Int]) -> Int {
    var maxVal = 0
    
    for i in arr {
        if (i > maxVal){
            maxVal = i
        }
    }
    return maxVal
}
//LinearSeach(arr: [2,7,3,6,9,3,78,23,45,0,32])
//Array must be sort, Best O1, wors avgO(log n)
func BinarySearch(arr: [Int], targetVal: Int) -> Int{
    var max = arr.count - 1
    var min = 0
    var guess = 0
    
    let tArr = arr.sorted()
    print(tArr)
    
    while min <= max {
        guess = (min + max) / 2
        if tArr[guess] == targetVal{
            return guess
        } else if tArr[guess] > targetVal {
            max = guess - 1
        } else {
            min = guess + 1
        }
    }
    return -1
}

//BinarySearch(arr: [24,34,1,23,78,5,3,9,45], targetVal: 5)
//SETS
let colors = Set(["red","green","blue","blue"])
colors.firstIndex(of: "green")

func fizzBuzz(n: Int) {
    var valueFizz = ""
    var valueBuzz = ""
    var valueNone = ""
    for i in 1...n {
        valueFizz = ""
        valueBuzz = ""
        valueNone = ""
        if (i % 3) == 0{
            valueFizz = "Fizz"
        }
        if (i % 5)==0 {
            valueBuzz = "Buzz"
        }
        if i % 3 != 0 && i%5 != 0{
            valueNone = String(i)
        }
        print(valueFizz + valueBuzz + valueNone)
    }
}
//fizzBuzz(n: 15)
func fizzBuzzR(n: Int) {
    var value = ""
    for i in 1...n {
        value = ""
        if i % 3 != 0 && i%5 != 0{
            print(i)
            continue
        }
        if (i % 3) == 0{
            value = "Fizz"
        }
        if (i % 5)==0 {
            value += "Buzz"
        }
        print(value)
    }
}
//fizzBuzzR(n: 15)

struct Product{
    let name: String
    let categories: [Category]
}
struct Category{
    let name: String
}

func filter(products: [Product], query: String?, categories:[Category]?) -> [Product]{
    let inQuery = query ?? ""
    let inCat = categories ?? []
    var retValues = [Product]()
    
    if inQuery.isEmpty && inCat.isEmpty {return products}
    
    let queries = inQuery.components(separatedBy: [",", " "])
    
    for q in queries{
        retValues.append(contentsOf:
            products.filter { $0.name.localizedCaseInsensitiveContains(q)}
        )
       
    }
   
    return retValues
}

//print(filter(products: [Product(name: "Ramon", categories: []), Product(name: "Carmen", categories: []) ], query: "em,ca", categories: [Category(name: "cat1")]))
    
let numbers = ["1","2","fish","3"]
let evensMap = numbers.map(Int.init)
let evensCompactMap = numbers.compactMap(Int.init)
let eventByTwo = evensCompactMap.map{ $0 * 2 }
print(eventByTwo)

