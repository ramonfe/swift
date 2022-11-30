import Foundation

import Foundation

//Linear Search if not sorted
//brute force
func lsearchn(arr: [Int], num: Int) -> Int{
    for c in 0..<arr.count{
        if num == arr[c]{ return c } 
    }
    return -1
}
//Binary search 9necesita estar ordenado)
func lsearch(arr: [Int], num: Int) -> Int{
    var left = 0
    var right = arr.count - 1
    var mid = 0

    if arr.count == 0 {
        return -1
    }
    //print("\(left)\(right)\(mid)")
    while left <=  right 
    {    
         mid = (left + right) / 2
        if arr[mid] == num { 
            return mid
        }      
       else if num <  arr[mid] {
            right = mid - 1           
        } else {
            left = mid + 1
        }        
    }
    return -1
}
print(lsearch(arr: [1,2,3,4,6,8,9,12], num: 4))
                      // mlr       
