import Foundation

func SearchFor(searchName:String)
{
    for anyUser:User in PopulateUsers()
    {
        if (anyUser.name == searchName){
            print("\(searchName) height is \(anyUser.height)")
        }
    }
}

SearchFor(searchName: "carmen")

