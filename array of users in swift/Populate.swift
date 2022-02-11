
import Foundation

func PopulateUsers()-> Array<User>
{
    var arrayUsers = Array<User>()
    
    arrayUsers.append(User(inpName: "ramon", inpLastName: "felix", inpHeight: 175, inpEyeColor: "brown", inpActive: true))
    
    arrayUsers.append(User(inpName: "carmen", inpLastName: "garcia", inpHeight: 168, inpEyeColor: "brown", inpActive: true))
    
    return arrayUsers
}
