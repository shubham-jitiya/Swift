import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

print(type(of: library))

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")


for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

//Type Casting for Any and AnyObject
//Type: Individually specific, globally any
var things: [Any] = []

//things.append(nil) //But we can add optional
var optionalType: Int? = 500
//things.append(optionalType) //warning
things.append(optionalType as Any) //warning
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

print(type(of: things))

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double: //-ve double
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

//common type & upcasting
class A {
    func checkClass() -> Void {
        print("Class A")
    }
}

class B: A {
    override func checkClass() -> Void {
        print("Class B")
    }
}

class C: A {
    override func checkClass() -> Void {
        print("Class C")
    }
}

var arr = [A(), B(), C()]
print(type(of: arr)) //Common class A
print(type(of: arr[1])) //Individually it is subclasses - B
print(type(of: arr[2])) //Individually it is subclasses - C

print(type(of: arr[1])) //Type - B
print(type(of: arr[1] as? A)) //Upcaste to superclass


//casting with as
var num: Any = 1
//var num: Any = 1.2
//var num: Any = "Str"

switch(num) {
case let num as Int:
    print("\(num) is integer")
case let num as Double:
    print("\(num) is double")
default:
    print("Type could not be found")
}

//var num2: Any = 1
var num2: Any = 1.2
//var num2: Any = "Str"


//checking type with is
switch(num2) {
case is Int:
    print("\(num) is integer")
case is Double:
    print("\(num) is double")
default:
    print("Type could not be found")
}
