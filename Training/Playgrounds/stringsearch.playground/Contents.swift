import Foundation

func stringsearch(long: String, short: String) -> Int{
    var along = Array(long)
    var ashort = Array(short)
    var countl = short.count
    var count = 0

    for i in 0..<long.count {
        for j in 0..<short.count {           
           // print("\(ashort[j])\(along[i+j])")
            if along[i+j] != ashort[j] {
               // print("break")
                break
            }           
            if j == short.count - 1{
                count += 1          
            }           
        }
    }
    return count
}
print(stringsearch(long: "lolrie loled",short:"lol" ))