func insertionSort(arr: [Int])-> [Int]{
    var arr = arr
    for i in 1..<arr.count{
       let cVal = arr[i]  
       var j =  i-1
       while (j >= 0 && arr[j] > cVal)
        {            
            arr[j+1] = arr[j]
            j -= 1
        }      
      arr[j+1] = cVal      
    }
    return arr
}
print(insertionSort(arr: [37,45,29,8,12,88,-3]))