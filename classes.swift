import Foundation

class Translate
{
    var language: String
    
    init(inpLanguage:String) {
        self.language = inpLanguage
    }
    
    func translate(word:String) 
    {
        if (language == "german")
        {
            print("hello is german is: hallo")
        }        
        else
        {
            print("hello in French is Bonjour")
        }
    }
}

var myTranslate = Translate(inpLanguage:"german")
myTranslate.translate(word:"hi")

class User 
{
    var name : String
    var photoName : String?
    var  uid : String

    init(inpName:String, inpPhotoName:String?) {
        self.name = inpName
        if let _inpPhoto = inpPhotoName{
            photoName = _inpPhoto
        }
        self.uid = UUID().uuidString
    }
    
}

var ramonUser : User = User(inpName:"ramon",inpPhotoName: nil)




print("user: \(ramonUser.name), uid: \(ramonUser.uid)")