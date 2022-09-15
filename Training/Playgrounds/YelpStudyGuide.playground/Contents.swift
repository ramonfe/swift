import UIKit

let places = ["Burgers", "Papas Burger", "Pizza Italiana"]

let findPlaces = places.filter{ $0.localizedCaseInsensitiveContains ("bur") }

print(findPlaces.prefix(5))
