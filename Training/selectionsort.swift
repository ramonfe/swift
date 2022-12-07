func selectionSort(arr: [Int])-> [Int]{
    var arr = arr
    for i in 0..<arr.count{
        var lowest = i        
        for j in i+1..<arr.count{
            if arr[j] < arr[lowest]{
                lowest = j
            }
        }      
        if lowest != i {            
            let temp = arr[i]
            arr[i] = arr[lowest]
            arr[lowest] = temp
        }
    }
    return arr
}
print(selectionSort(arr: [37,45,29,8,12,88,-3]))