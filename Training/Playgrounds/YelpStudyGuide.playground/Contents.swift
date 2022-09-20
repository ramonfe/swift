import UIKit
/*
 Given a list of businesses and a desired search text find the first 3 businesses prefix-matching the searched phrase (on any of the words)
 */
let places = ["Burgers", "Papas Burger", "Pizza Italiana"]
let findPlaces = places.filter{ $0.localizedCaseInsensitiveContains ("bur") }
print(findPlaces.prefix(5))

//remove extra spaces from string
let stringWspaces = "string with spaces at end         "

print(stringWspaces.trimmingCharacters(in: .whitespaces))

