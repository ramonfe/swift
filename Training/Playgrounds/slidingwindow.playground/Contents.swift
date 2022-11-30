import Foundation
//On2
func maxSubArrayNaive(arr: [Int], num: Int) -> Int{  
    var max = 0
    var temp = 0
    if num > arr.count {
        return -1
    }
    for i in 0...arr.count - num{
        temp = 0
        for j in 0..<num {
            temp += arr [i+j]           
        }        
        if temp > max {
            max = temp
        }
    }
    return max
}
func maxSubArray(arr: [Int], num: Int) -> Int{
    if num > arr.count { return -1 }
    var temp = 0
    var max = 0
    for i in 0..<num {
        max += arr[i]
    }
    temp = max
    for j in num..<arr.count{
        temp = temp - arr[j-num] + arr[j]     
       if temp > max {
            max = temp
        }       
    }    
    return max
}
print(maxSubArrayNaive(arr: [2,6,57,98,1], num: 2))