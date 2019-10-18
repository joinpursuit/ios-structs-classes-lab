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

var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"

struct BankAccount {
    var owner: String
    var balance: Double
    
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)
print(joeAccount.balance)
print(joeOtherAccount.balance)

struct Person {
    let firstName: String
    let middleName: String?
    let lastName: String
    func fullName() -> String {
        "\(firstName) \(middleName ?? "") \(lastName)"
    }
}

let ahad = Person(firstName: "Ahad", middleName: nil, lastName: "Islam")
let eddie = Person(firstName: "Edward", middleName: "O", lastName: "Neil")

print(eddie.firstName)
print(eddie.fullName())
print(ahad.fullName())

struct Book {
    let title: String
    let author: String
    let rating: Double
    func isGood() -> Bool {
        if self.rating >= 7.0 { return true }
        else { return false }
    }
}

let hundredYearsOfSolitude = Book(title: "One Hundred Years of Solitude", author: "Gabriel Garcia Marquez", rating: 100.0)
let flowersForAlgernon = Book(title: "Flowers for Algernon", author: "Daniel Keyes", rating: 10.0)
let warAndPeace = Book(title: "War and Peace", author: "Leo Tolstory", rating: 5.0)

class Dog {
    static var count = 0
    var name = "dog"
    var breed = "unknown"
    var mood = "calm"
    var hungry = false
    
    init() { Dog.count += 1 }
    func playFetch() {
        self.hungry = true
        self.mood = "playful"
        print("Ruff")
    }
    func feed() {
        if self.hungry {
            hungry = false
            print("Woof!")
        } else {
            print("The dog doesn't look hungry.")
        }
    }
    func toString() -> String {
        return """
        Name: \(self.name)
        Breed: \(self.breed)
        Mood: \(self.mood)
        """
    }
    
}

var dog1 = Dog()
dog1.name
dog1.breed
dog1.mood
dog1.hungry

var dog2 = Dog()
dog2.name = "Rhett"
dog2.breed = "English Setter"
dog2.mood = "excited"
dog2.hungry = false

dog2.playFetch() //prints "Ruff!"
dog2.hungry //returns true
dog2.mood //returns "playful"

var dog3 = Dog()
dog3.name = "Partner"
dog3.breed = "Golden Retriever"
dog3.mood = "thoughtful"
dog3.hungry = true

dog3.feed() //prints "Woof!"
dog3.hungry //returns false

var dog4 = Dog()
dog4.name = "Rascal"
dog4.breed = "Golden Retriever"
dog4.mood = "feeling pawesome"
dog4.hungry = true
print(dog4.toString())
//prints:
//Name: Rascal
//Breed: Golden Retriever
//Mood: feeling pawesome

Dog.count

struct FreezingPoint {
    let celsius = 0.0
    let fahrenheit = 32.0
    let kelvin = 237.2
}

struct Celsius {
    var celsius: Double
    
    func getFahrenheitTemp() -> Double {
        return 1.8 * self.celsius + 32
    }
    func getKelvinTemp() -> Double {
        return self.celsius + 273
    }
    func isBelowFreezing(freezingC: FreezingPoint) -> Bool {
        self.celsius < freezingC.celsius ? true : false
    }
}



var tenDegreesCelsius = Celsius(celsius: 10.0)
tenDegreesCelsius.celsius //returns 10.0
tenDegreesCelsius.getKelvinTemp() //returns 283.0
tenDegreesCelsius.getFahrenheitTemp() //returns 50.0

