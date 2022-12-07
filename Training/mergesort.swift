func merge(arr1: [Int], arr2: [Int]) -> [Int]{
    var arr = [Int]()
    var i = 0
    var j = 0

    while (i < arr1.count && j < arr2.count){
        if (arr2[j] > arr1[i]){
            arr.append(arr1[i])
            i += 1
        }else{
            arr.append(arr2[j])
            j += 1
        }
    }
    while i < arr1.count{
        arr.append(arr1[i])
        i += 1
    }
    while j < arr2.count{
        arr.append(arr2[j])
        j += 1
    }
    print(arr)
    return arr
}
func mergeSort(arr: [Int]) -> [Int]{
    if arr.count <= 1 {return arr}
    let mid = arr.count / 2
    let left =  mergeSort(arr: Array(arr[0..<mid]))
    let right = mergeSort(arr: Array(arr[mid..<arr.count]))
    return merge(arr1: left, arr2: right)    
}
print(mergeSort(arr: [10,24,76,73]))