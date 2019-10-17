import UIKit

class Giant {
    var name : String = "Fred"
    var weight : Double = 340.0
    var homePlanet: String = "Earth"
}

let fred = Giant()
fred.homePlanet = "Mars"

struct Alien {
    var name: String
    var height: Double
    var homePlanet: String
}

var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"

let edgar = Giant()
edgar.name = "edgar"
let jason = edgar
jason.name = "Jason"

print(edgar.name)
print(jason.name)

