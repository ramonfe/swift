func bubbleSort(arr: [Int])->[Int]{
    var arr = arr
    var noswap = true
    for i in stride(from: arr.count, to: 1, by: -1)
    {
        noswap = true 
        for j in 0..<(i-1){
            print("\(arr)\(arr[j]) \(arr[j+1])")           
            if arr[j] > arr[j+1]{
                noswap = false
                let temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }           
        }
        if noswap { break }
    }
    return arr
}
print(bubbleSort(arr: [37,45,29,8,12,88,-3]))