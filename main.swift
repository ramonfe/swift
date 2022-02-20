import Foundation

var thisIsClosure = { () -> () in }

var sayHiClosure = { (inpName : String) -> String in
    return "Hi \(inpName)"
}

func sayHi(inpName:String)-> String {
    return "Hi \(inpName)"
}

//print("\(sayHiClosure("Ramon"))")
func multiPurFunc (vals:Array<Int>,closure:(Int)->Bool)
{
    for eachNum in vals{
        if (closure (eachNum)){
            print(eachNum)
        }
    }
}
multiPurFunc(vals: [100,200,500,700,2,3,4,5])
{(val)->Bool in
    val > 500
}
//closure en una variable si lo vamos a usar + 1 vez
typealias onlineClosure = (Bool,[String]?)->Void
//escaping closures, async
func fetchPhotos(link:String,
                 completion: @escaping onlineClosure){
    let status = arc4random_uniform(2)==0
    if (status){
        completion(true,["photo1","photo2"])
    }
    else{
        completion(false,nil)
    }
}

fetchPhotos(link: "somelink") { (res, photoArr) in
    if(res){
        print(photoArr)
    }
    else{
        print("error reading network")
    }
}
