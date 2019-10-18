# Structs and Classes lab

Fork and clone this repo. On your fork, answer and commit the follow questions. When you are finished, submit the link to your repo on Canvas.


## Question 1

Given this class that represents a giant:

```swift
class Giant {
 var name: String = "Fred"
 var weight: Double = 340.0
 let homePlanet: String = "Earth"
}

let fred = Giant()
```

Will these three lines of code run? If not, why not?

```swift
fred.name = "Brick"
fred.weight = 999.2
fred.homePlanet = "Mars"
```

```
The first two lines of code will run, however, the last line that sets the homePlanet property will not run as it is a constant and cannot assume another value. 
```

Fix the class definition for `Giant` in the space below so that it **does** work:

```
The class definition can be fixed by simply changing the let in front of homePlanet to var.

class Giant {
 var name: String = "Fred"
 var weight: Double = 340.0
 var homePlanet: String = "Earth"
}
```


## Question 2

Take a look at this struct that represents an alien:

```swift
struct Alien {
 var name: String
 var height: Double
 var homePlanet: String
}
let bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")
```

Will these three lines of code run? If so, why not?

```swift
bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"
```
```
The three lines of code above will not run because "bilbo" is declared as a constant, and structures are value types, which makes them immutable when declared as constants. 
```
Change the declaration of `bilbo` so that the above three lines of code **do** work:

```
This code can be fixed by declaring bilbo as a variable and not a constant. 

var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

```


## Question 3

Consider this bit of code that uses the `Giant` class:

```swift
let edgar = Giant()
edgar.name = "edgar"
let jason = edgar
jason.name = "Jason"
```

What will the value of `edgar.name` be after those three lines of code are run? What will the value of `jason.name` be? Why?

```
Giant is a reference type, which means that rather than defining two instances of Giant called edgar and jason, what is being done is having two constants reference the same instance of Giant. After the above code is executed, both jason.name and edgar.name will have a value of "Jason".
```

## Question 4

Given this bit of code that uses the `Alien` struct:

```swift
var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"
```

What will the value of `charles.homePlanet` be after the above code run? What about the value of `charlesFromJupiter.homePlanet`? Why?

```
Alien is a value type, which means that charles and charlesFromJupiter are two separate instances of type Alien. After the above code is executed, charles.homePlant will have a value of "Pluto", and charlesFromJupiter.homePlanet will have a value of "Jupiter".
```

## Question 5

Here's a struct that represents a bank account:

```swift
struct BankAccount {
 var owner: String
 var balance: Double

 func deposit(_ amount: Double) {
 balance += amount
 }

 func withdraw(_ amount: Double) {
 balance -= amount
 }
}
```

Does this code work? Why or why not?

```
The methods of the structure BankAccount are attempting to alter the value of one its own stored properties, balance. Because BankAccount is a structure, which also makes it a value type, it is impossible to have methods that alter the value of its stored properties without prefixing the methods with the word "mutating".
```

Fix the `BankAccount` struct so it does work.

```
The BankAccount structure can be fixed by prefixing the methods with the word mutating.

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
```

Given the code below (which should incorporate any fixes you made):

```swift
var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)
```
```
The final line of code from the three above should incorporate the fixes. This is because the withdraw method is called on that line. 
```

What will the value of `joeAccount.balance` be after the above code runs? What about the value of `joeOtherAccount.balance`? Why?

```
After the above three lines of code executes, the value of joeAccount.balance will be 50.0, and the value of joeOtherAccount.balance will be 100.0. The reason for this is that BankAccount is a structure, and a value type, which means joeAccount and JoeOtherAccount are two separate instances of type BankAccount, and not references to the same instance. 
```

## Question 6

a. Write a struct called `Person` that has 3 properties of type `String`: a first name, a last name and a middle name. Have the middle name be optional. Create 2 instances of a `Person`, one with a middle name and one without. Print one of their first names.

```
struct Person{
var firstName: String
var middleName: String?
var lastName: String

func fullName() -> String{
guard let unwrappedMiddle = self.middleName else{
return self.firstName + " " + self.lastName
    }
    return self.firstName + " " + unwrappedMiddle + " " + self.lastName
}
}

var person1 = Person(firstName: "Johanna", middleName: "Margaret", lastName: "Watson")
var person2 = Person(firstName: "Michael", lastName: "Miller")

print(person1.firstName)
```

b. Write a method in `Person` called `fullName` that will return a formatted string of an instance's full name. Call this method on both the instances you created in part a.

```
print(person1.fullName())
print(person2.fullName())
```

## Question 7

a. Create a struct called `Book` that has properties `title`, `author` and `rating`, of type `String`, `String`, and `Double` respectively. Create some instances of `Book`.

```
struct Book{
var title: String
var author: String
var rating: Double
}

var book1 = Book(title: "SomeBookTitle", author: "SomeAuthor", rating: 5.2)
var book2 = Book(title: "Ladder to the Sky", author: "AuthorName", rating: 6.3)
var book3 = Book(title: "Sweet Little Lies", author: "Kaz Frear", rating: 8.9)
```

b. Add a method to `Book` called `isGood` that returns `true` if its rating is greater than or equal to 7

```
struct Book{
var title: String
var author: String
var rating: Double

func isGood() -> Bool{
    if self.rating >= 7{
        return true
    } else {
        return false
    }
}

}

```

## Question 8

```swift
class Dog {
var name: String = "dog"
var breed: String = "unknown"
var mood: String = "calm"
var hungry: Bool = false
static var count: Int = 0
   
   static func incrementCount(){
       count += 1
   }

   init(name: String, breed: String, mood: String, hungry: Bool){
       self.name = name
       self.breed = breed
       self.mood = mood
       self.hungry = hungry
       Dog.incrementCount()
   }
   
func playFetch() -> Void {
self.hungry = true
self.mood = "playful"
print("Ruff!")
}

func feed() -> Void{
if self.hungry{
self.hungry = false
print("Woof!")
} else {
print("The dog does not look hungry.")
}
}

func toString() -> String{
let returnString = "Name: \(self.name)\nBreed: \(self.breed)\nMood: \(self.mood)"
return returnString
}

}
```

Work through the following tasks one by one, in order. Each time, add to the `Dog` class above. Each task has sample output that you should be able to replicate when you are done.

a. Give `Dog` four properties, all with default values: `name (string), breed (string), mood (string), and hungry (boolean)`.

```swift
var dog1 = Dog()
dog1.name //returns "dog"
dog1.breed //returns "unknown"
dog1.mood //returns "calm"
dog1.hungry //returns false
```

b. Add an instance method called `playFetch()`. It should set the dog's `hungry` property to `true`, set its mood property to `playful`, and print "Ruff!"

```swift
var dog2 = Dog()
dog2.name = "Rhett"
dog2.breed = "English Setter"
dog2.mood = "excited"
dog2.hungry = false

dog2.playFetch() //prints "Ruff!"
dog2.hungry //returns true
dog2.mood //returns "playful"
```

c. Add an instance method called `feed()`. If the dog is hungry, it should set `hungry` to `false` and print "Woof!" If the dog is not hungry, it should print "The dog doesn't look hungry"

```swift
var dog3 = Dog()
dog3.name = "Partner"
dog3.breed = "Golden Retriever"
dog3.mood = "thoughtful"
dog3.hungry = true

dog3.feed() //prints "Woof!"
dog3.hungry //returns false
```

d. Add an instance method called `toString` that returns a `String` type description of the dog:

```swift
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
```

e. Add a type property called `count` that keeps track of how many dogs have been created so far.

//Ex: There have been four dogs created so far
`Dog.count //returns 4`


## Question 9

There are three common scales that are used to measure temperature: Celsius, Fahrenheit, and Kelvin:

C = (F - 32) / 1.8
F = 1.8 * C + 32
K = C + 273

a. Make a struct called `FreezingPoint` that has three static properties: `celsius`, `fahrenheit`, and `kelvin`. Give them all values equal to the freezing point of water.

```
struct FreezingPoint{
static var celsius: Double = 0
static var fahrenheit: Double = 32
static var kelvin: Double = 273
}
```

b. Make a struct called `Celsius` that has one property: `celsius`, and two methods `getFahrenheitTemp`, and `getKelvinTemp`. Make the values of `fahrenheit` and `kelvin` correct values, converted from the `celsius` property.

```swift
var tenDegreesCelsius = Celsius(celsius: 10.0)
tenDegreesCelsius.celsius //returns 10.0
tenDegreesCelsius.getKelvinTemp() //returns 283.0
tenDegreesCelsius.getFahrenheitTemp() //returns 50.0
```

```
struct Celsius{
var celsius: Double = 0
var fahrenheit: Double {
    get{
    return self.getFahrenheitTemp()
    }
}
var kelvin: Double {
    get{
    return self.getKelvinTemp()
    }
}

func getFahrenheitTemp() -> Double {
return (self.celsius * 1.8) + 32
}
func getKelvinTemp() -> Double{
return self.celsius + 273
}
}
```

c. Give the `Celsius` struct a method called `isBelowFreezing` that returns a `Bool` (true if the temperature is below freezing).

```
struct Celsius{
var celsius: Double = 0

func getFahrenheitTemp() -> Double {
return (self.celsius * 1.8) + 32
}
func getKelvinTemp() -> Double{
return self.celsius + 273
}
func isBelowFreezing() -> Bool{
if self.celsius < FreezingPoint.celsius{
    return true
    } else {
    return false
}
}
}
```

## Question 10

Create a struct called `RGBColor` that has 3 properties, `red`, `green`, `blue` that are all of type `Double`.

Given the below array of color dictionaries, create an array of `RGBColor`.

```swift
let colorDictArray: [[String: Double]] = [["red": 1.0, "green": 0.0, "blue": 0.0],
 ["red": 0.0, "green": 1.0, "blue": 0.0],
 ["red": 0.0, "green": 0.0, "blue": 1.0],
 ["red": 0.6, "green": 0.9, "blue": 0.0],
 ["red": 0.2, "green": 0.2, "blue": 0.5],
 ["red": 0.5, "green": 0.1, "blue": 0.9],]
```
```
struct RGBColour{
var red: Double = 0
var green: Double = 0
var blue: Double = 0
}

var RGBColourArray: [RGBColour] = []

for colour in colorDictArray{
    let red = colour["red"] ?? 0.0
    let green = colour["green"] ?? 0.0
    let blue = colour["blue"] ?? 0.0
    let newRGBColour = RGBColour(red: red, green: green, blue: blue)
    RGBColourArray.append(newRGBColour)
}
```


## Question 11

a. Create a struct called `Movie` that has properties for `name` (`String`), `year` (`Int`), `genre` (`String`), `cast` (`[String]`), and `description` (`String`). Create an instance of your `Movie` class

```
struct Movie{
var name: String
var year: Int
var genre: String
var cast: [String]
var description: String
}

var newMovie = Movie(name: "Borat", year: 2006, genre: "comedy", cast: ["Sacha Baron Cohen"], description: "a man named Borat who was visiting America from Kazakhstan.")
```

b. Create an instance method inside `Movie` called `blurb` that returns a formatted string describing the movie.

Ex: "Borat came out in 2006. It was an odd film starring Sacha Baron Cohen as a man named Borat who was visiting America from Kazakhstan."

```
struct Movie{
var name: String
var year: Int
var genre: String
var cast: [String]
var description: String

func blurb() -> String{
return "\(self.name) came out in \(self.year). It was a(n) \(self.genre) starring \(cast). It was about \(self.description)."
}
}

```


## Question 12

Create a function outside of your `Movie` struct called `makeMovie` that takes in a dictionary of type `[String: Any]`, like `dieHardDict` below, and returns an `optional Movie`. Use `dieHardDict` to create an instance of a `Movie`.

```swift
let dieHardDict: [String: Any] = ["name": "Die Hard",
 "year" : 1987,
 "genre": "action",
 "cast": ["Bruce Willis", "Alan Rickman"],
 "description": "John Mclain saves the day!"]
```
```
func makeMovie(_ inputDict: [String: Any]) -> Movie?{
   
   let name = inputDict["name"] as? String ?? ""
   let year = inputDict["year"] as? Int ?? 1978
   let genre = inputDict["genre"] as? String ?? ""
   let cast = inputDict["cast"] as? [String] ?? [String]()
   let description = inputDict["description"] as? String ?? ""
   let movie = Movie(name: name, year: year, genre: genre, cast: cast, description: description)
   
   return movie
}
```

Hint: To use a value type `Any`, you will need to cast it to its expected type.

Below, `nameAsAny` is of type `Any` because thats the type of the value in the dictionary:

```swift
if let nameAsAny = dieHardDict["name"] {
 print(nameAsAny)
}
```

Below, `nameAsString` is of type `String` because the optional binding is attempting to cast it as a `String`.

```swift
if let nameAsString = dieHardDict["name"] as? String {
 print(nameAsString)
}
```

If the binding fails it returns `nil`. `1987` cannot be cast as a `String` because it is a number.

```swift
if let yearAsString = dieHardDict["year"] as? String {
 print(yearAsString)
} else {
 print("this didn't work")
}
```

## Question 13

Given the below array of movie dictionaries, use your function from the last question to create a `Array` of `Movie`.

```swift
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
```
```
var movieArray: [Movie] = []

for movie in movies {
   if let unwrappedMovie = makeMovie(movie){
   movieArray.append(unwrappedMovie)
   }
}
```
