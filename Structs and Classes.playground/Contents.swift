import UIKit

//1
class Giant {
 var name: String = "Fred"
 var weight: Double = 340.0
 let homePlanet: String = "Earth"
}

let fred = Giant()

//2
struct Alien {
 var name: String
 var height: Double
 var homePlanet: String
}
var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"

//5
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

//6
struct Person {
    var firstName: String
    var lastName: String
    var middleName: String?
    
    func fullName () -> String {
        return firstName + (middleName ?? "") + lastName
    }
}

var joe = Person(firstName: "Joe", lastName: "Biden", middleName: "Idk")
var john = Person(firstName: "John", lastName: "Gotti")
print(john.firstName)

//7
struct Book {
    var title, author: String
    var rating: Double
    func isGood () -> Bool {
        self.rating >= 7 ?  true : false
    }
}

let Nineteen = Book(title: "1984", author: "Mom", rating: 5)
let Birb = Book(title: "Bird", author: "Ma", rating: 4)
Birb.isGood()

//8
class Dog {
    var name = "", breed = "", mood: String = ""
    var hungry = false
    static var count = 0
    
    func playFetch() {
        hungry = true
        mood = "Playful"
        print("Ruff")
    }
    
    func feed() {
        if hungry == true {
            hungry = false
            print("Woof")
        } else {
            print("The dog doesn't look hungry")
        }
    }
    
    func toString() -> String {
        var desc = String()
        desc = "Name: \(name) \nBreed: \(breed) \nMood: Feeling pawesome"
        return desc
    }
    init() {
        Dog.count += 1
    }
}
var dog1 = Dog()
dog1.name //returns "dog"
dog1.breed //returns "unknown"
dog1.mood //returns "calm"
dog1.hungry //returns false

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

Dog.count
//9
struct FreezingPoint {
    static var celsius = 0.0
    static var farenheit = 32.0
    static var kelvin =  273.3
}

struct Celsius{
    var celsius:Double
    
    func getFahrenheitTemp() -> Double {
        return 1.8 * celsius + 32
    }
    func getKelvinTemp() -> Double {
        return celsius + 273
    }
    func isBelowFreezingPoint() -> Bool {
        if self.celsius < FreezingPoint.celsius {
            return true
        } else {
            return false
        }
    }
}

//10
struct RGBColor{
    var red, blue, green : Double?
}

func rgbArr(dictColorArr:[[String:Double]]) -> [RGBColor]{
    var rgbColor = RGBColor(red: nil, blue: nil, green: nil)
    var newRGBArr = [RGBColor]()
    for dictElement in dictColorArr {
        rgbColor.red = dictElement["red"] ?? 0
        rgbColor.green = dictElement["green"] ?? 0
        rgbColor.blue = dictElement["blue"] ?? 0
        newRGBArr.append(rgbColor)
    }
    return newRGBArr
}

let colorDictArray: [[String: Double]] = [["red": 1.0, "green": 0.0, "blue": 0.0],
["red": 0.0, "green": 1.0, "blue": 0.0],
["red": 0.0, "green": 0.0, "blue": 1.0],
["red": 0.6, "green": 0.9, "blue": 0.0],
["red": 0.2, "green": 0.2, "blue": 0.5],
["red": 0.5, "green": 0.1, "blue": 0.9],]

//11
struct Movie1 {
    var name:String
    var year:Int
    var genre:String
    var cast:[String]
    var description: String
    
    init(name: String, year: Int, genre: String, cast: [String], description: String) {
        self.name = name
        self.year = year
        self.genre = genre
        self.cast = cast
        self.description = description
    }
    
    func info()->String {
        return "\(name) came out in \(year). It was an \(genre) film starring \(cast.description)"
    }
}

let blurb = Movie1(name: "Batman", year: 2008, genre: "action", cast: ["Bob", "Sob", "Cob"], description: "ADFAFAFA")
blurb.info()

//12
struct Movie {
    var name:String?
    var year:Int?
    var genre:String?
    var cast:[String]?
    var description: String?
    
    func info()->String {
        return "\(String(describing: name)) came out in \(String(describing: year)). It was an \(String(describing: genre)) film starring \(String(describing: cast?.description))"
    }
}
func makeMovie(movie: [String: Any]) -> Movie {
    var newMovie = Movie(name: "", year: 0, genre: "", cast: [""], description: "")
    newMovie.name = movie["name"] as? String ?? ""
    newMovie.year = movie["year"] as? Int ?? 0
    newMovie.genre = movie["genre"] as? String ?? ""
    newMovie.cast = movie["cast"] as? [String] ?? [""]
    newMovie.description = movie["description"] as? String ?? ""
    
    return newMovie
}

let dieHardDict: [String: Any] = ["name": "Die Hard",
"year" : 1987,
"genre": "action",
"cast": ["Bruce Willis", "Alan Rickman"],
"description": "John Mclain saves the day!"]

makeMovie(movie: dieHardDict)
//13

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

var movieArr = [Movie()]

for movieData in movies {
    movieArr.append(makeMovie(movie: movieData))
}

