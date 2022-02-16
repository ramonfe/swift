import Foundation

enum PropType {
    case Sale
    case Rent
}

class Property{
    var address:String!
    var type:PropType!
    
    init(iAddress:String,iType:PropType) {
        self.address = iAddress
        self.type=iType
    }
}

var thisProperty = Property(iAddress: "some address", iType: PropType.Rent)

if (thisProperty.type == PropType.Sale){
    
}

enum Cities : CaseIterable {
    case Guasave, Mochis, Culiacan
}

for city in Cities.allCases
{
    print(city)
}
