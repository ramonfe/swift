import Foundation
//two pointers al inicio y al final
func sumcero(arr: [Int]) -> [Int]{
    var left = 0
    var right = arr.count-1
    var sum = 0
    while left < right {
        sum = arr[left] +  arr[right]
        if sum == 0 {
            return [arr[left], arr[right]]
        }
        else if sum > 0{
            right -= 1
        } else {
            left += 1
        }
    }
    return [-1,-1]
}

func countUniqueValues(arr: [Int]) -> Int{
    var count = 0
    // //dictionary for ordered or not ordered
    // var dict = [Int:Int]()
    // for i in arr{
    //      (dict[i] == nil) ? (dict[i] = 1) :  (dict[i]! += 1)                  
    // }        
    // return dict.count

    //two pointer for ordered
    var newArr = arr
    var i = 0
    for var j in 1..<newArr.count {            
        if newArr[i] != newArr[j]{
            i += 1    
            newArr[i] = newArr[j]       
        }
    }
    count = i + 1
    return count
}
print(countUniqueValues(arr: [1,2,2,3,5,5,7]))
