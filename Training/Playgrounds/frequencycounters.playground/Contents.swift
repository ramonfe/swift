import Cocoa

func sumChar(str: String) -> [Character:Int]{
    var obj = [Character:Int]()
    var convertObj = str.lowercased()
    
    for i in convertObj{
        if obj[i] == nil {
            obj[i] = 1
        }else{
            obj[i]! += 1
        }
    }
    
    return obj
}
//print(sumChar(str: "Hola mundoh"))

func foundSquare(arr1: [Int], arr2: [Int]) -> Bool{
    if arr1.count != arr2.count{
        return false
    }
    var varArr = arr2
    for i in arr1{
        guard let idx = varArr.firstIndex(of: i * i) else {return false}
        print(varArr)
        varArr.remove(at: idx)
    }
    return true
}
//foundSquare(arr1: [1,2,3,2], arr2: [1,4,4,1])

func anagram(str1: String, str2:String) -> Bool{
    if str1.count != str2.count {
        return false
    }
    var dStr1 = [Character:Int]()
    //var dStr2 = [Character:Int]()
    
    for c in str1.lowercased(){
        if dStr1[c] == nil{
            dStr1[c] = 1
        }else{
            dStr1[c]! += 1
        }
    }
    for c in str2.lowercased(){
        if dStr1[c] == nil || dStr1[c]! == 0 {
            return false
        }else{
            dStr1[c]! -= 1
        }
    }
//    for c in str1{
//        if dStr2[c] == nil || (dStr1[c] != dStr2[c]){
//            return false
//        }
//    }
    return true
}
anagram(str1:"Anagram",str2:"nagaram")
