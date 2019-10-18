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

struct RGBColor {
    let red: Double
    let green: Double
    let blue: Double
    
    //    init(red: Double, green: Double, blue: Double) {
    //        self.red = red
    //        self.green = green
    //        self.blue = blue
    //    }
}

let colorDictArray: [[String: Double]] = [
    ["red": 1.0, "green": 0.0, "blue": 0.0],
    ["red": 0.0, "green": 1.0, "blue": 0.0],
    ["red": 0.0, "green": 0.0, "blue": 1.0],
    ["red": 0.6, "green": 0.9, "blue": 0.0],
    ["red": 0.2, "green": 0.2, "blue": 0.5],
    ["red": 0.5, "green": 0.1, "blue": 0.9],]

func dictToArrayColor(_ arrayOfDict:[[String: Double]]) -> [RGBColor] {
    var rGBColorArray = [RGBColor]()
    for dict in arrayOfDict {
        for _ in dict {
            let red = dict["red"] ?? -1
            let green = dict["green"] ?? -1
            let blue = dict["blue"] ?? -1
            let rgbColor = RGBColor(red: red, green: green, blue: blue)
            rGBColorArray.append(rgbColor)
        }
    }
    return rGBColorArray
}

struct Movie {
    let name: String
    let year: Int
    let genre: String
    let cast: [String]
    let description: String
    
    func blurb() -> String {
        "\(name), a \(genre.lowercased()) movie that came out in \(year), starring \(cast[0]): \(description)"
    }
}

let joker = Movie(name: "Joker",
                  year: 2019,
                  genre: "Psychological Thriller",
                  cast: ["Joaquin Phoenix", "Robert De Niro", "Zazie Beetz", "Frances Conroy"],
                  description: "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he's part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.")
print(joker.blurb())

func makeMovie(_ movieDict: [String: Any]) -> Movie? {
    let name = movieDict["name"] as? String ?? ""
    let year = movieDict["year"] as? Int ?? -1
    let genre = movieDict["genre"] as? String ?? ""
    let cast = movieDict["cast"] as? [String] ?? [""]
    let description = movieDict["description"] as? String ?? ""
    let movie = Movie(name: name, year: year, genre: genre, cast: cast, description: description)
    return movie
}

let dieHardDict: [String: Any] = ["name": "Die Hard",
                                  "year" : 1987,
                                  "genre": "action",
                                  "cast": ["Bruce Willis", "Alan Rickman"],
                                  "description": "John Mclain saves the day!"]

print(makeMovie(dieHardDict)!.blurb())

// movies is an Array of Dictionaries
// each element of movies is a Dictionary with the keys
// 'name','year', 'genre', 'cast' and 'description'
var movies: [[String:Any]] = [
    [
        "name": "Minions",
        "year": 2015,
        "genre": "animation",
        "cast": ["Sandra Bullock", "Jon Hamm", "Michael Keaton"],
        "description": "Evolving from single-celled yellow organisms at the dawn of time, Minions live to serve, but find themselves working for a continual series of unsuccessful masters, from T. Rex to Napoleon. Without a master to grovel for, the Minions fall into a deep depression. But one minion, Kevin, has a plan."
    ],
    [
        "name": "Shrek",
        "year": 2001,
        "genre": "animation",
        "cast": ["Mike Myers", "Eddie Murphy", "Cameron Diaz"],
        "description": "Once upon a time, in a far away swamp, there lived an ogre named Shrek whose precious solitude is suddenly shattered by an invasion of annoying fairy tale characters. They were all banished from their kingdom by the evil Lord Farquaad. Determined to save their home -- not to mention his -- Shrek cuts a deal with Farquaad and sets out to rescue Princess Fiona to be Farquaad\"s bride. Rescuing the Princess may be small compared to her deep, dark secret."
    ],
    [
        "name": "Zootopia",
        "year": 2016,
        "genre": "animation",
        "cast": ["Ginnifer Goodwin", "Jason Bateman", "Idris Elba"],
        "description": "From the largest elephant to the smallest shrew, the city of Zootopia is a mammal metropolis where various animals live and thrive. When Judy Hopps becomes the first rabbit to join the police force, she quickly learns how tough it is to enforce the law."
    ],
    [
        "name": "Avatar",
        "year": 2009,
        "genre": "action",
        "cast": ["Sam Worthington", "Zoe Saldana", "Sigourney Weaver"],
        "description": "On the lush alien world of Pandora live the Na\"vi, beings who appear primitive but are highly evolved. Because the planet\"s environment is poisonous, human/Na\"vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully, a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na\"vi woman. As a bond with her grows, he is drawn into a battle for the survival of her world."
    ],
    [
        "name": "The Dark Knight",
        "year": 2008,
        "genre": "action",
        "cast": ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
        "description": "With the help of allies Lt. Jim Gordon and DA Harvey Dent, Batman has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker suddenly throws the town into chaos, the caped Crusader begins to tread a fine line between heroism and vigilantism."
    ],
    [
        "name": "Transformers",
        "year": 2007,
        "genre": "action",
        "cast": ["Shia LaBeouf", "Megan Fox", "Josh Duhamel"],
        "description": "The fate of humanity is at stake when two races of robots, the good Autobots and the villainous Decepticons, bring their war to Earth. The robots have the ability to change into different mechanical objects as they seek the key to ultimate power. Only a human youth, Sam Witwicky can save the world from total destruction."
    ],
    [
        "name": "Titanic",
        "year": 1997,
        "genre": "drama",
        "cast": ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"],
        "description": "The ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912."
    ],
    [
        "name": "The Hunger Games",
        "year": 2012,
        "genre": "drama",
        "cast": ["Jennifer Lawrence", "Josh Hutcherson", "Liam Hemsworth"],
        "description": "Katniss Everdeen voluntarily takes her younger sister\"s place in the Hunger Games, a televised competition in which two teenagers from each of the twelve Districts of Panem are chosen at random to fight to the death."
    ],
    [
        "name": "American Sniper",
        "year": 2014,
        "genre": "drama",
        "cast": ["Bradley Cooper", "Sienna Miller", "Kyle Gallner"],
        "description": "Navy S.E.A.L. sniper Chris Kyle\"s pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home to his wife and kids after four tours of duty, however, Chris finds that it is the war he can\"t leave behind."
    ]
]

func arrayOfMovies(_ arrDict:[[String:Any]]) -> [Movie] {
    var movieArray = [Movie]()
    for dict in arrDict {
        movieArray.append(makeMovie(dict)!)
    }
    return movieArray
}
