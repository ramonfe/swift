import Foundation

//initialize dictionaries
var dict : [String:String]= [:]
//initialize two
var dict2 : Dictionary<String,String>= ["nameKey","valueKey"]
//initialize three
var myDict = [  "keyName": "ramon", 
                "keyAge": "48"]

myDict["keyAge"]="49"//update
myDict["lstNameKey"]="felix"//add notexisting key

//
for (key,val) in myDict
{
    print("key is: \(key) value is: \(val)")
}

//Tuple
var  myTuple = (firstName: "ramon",
                lastName: "felix")
print(myTuple.firstName)



