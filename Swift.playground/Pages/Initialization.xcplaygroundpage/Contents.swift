import Foundation

//1. Initialiser with no parameter
//struct Fahrenheit {
//    var temperature: Double
//
//    init() {
//        temperature = 32.0
//    }
//}
//
//var f = Fahrenheit()
//f.temperature
//------------------ 2. Default value ------------------|
//2. Default value
struct Fahrenheit {
    var temperature = 32.0
}

var f = Fahrenheit()
f.temperature

//------------------ 3. initialization parameter ------------------|
struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

//------------------ 4. Parameter Names and Argument Labels ------------------|
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red    = red
        self.green  = green
        self.blue   = blue
    }
   
    init(white: Double) {
        red     = white
        green   = white
        blue    = white
    }
}

//let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - argument labels are required

//------------------ 5. Without argument labels ------------------|
struct CelsiusSecond {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celcius: Double) {
        temperatureInCelsius = celcius
    }
}

let todaysTemp = CelsiusSecond(42)
todaysTemp.temperatureInCelsius

//------------------ 6. Optional property type ------------------|
class SurveyQuestion {
    var question: String
    var response: String?
    
    init(question: String){
        self.question = question
    }
    
    func ask() {
        print(question)
    }
}

let q1 = SurveyQuestion(question: "What is your daily mobile usage time?")
q1.ask()
q1.response = "2 hrs" //setting property later
q1.response

//------------------ 7. Assiging constant properties ------------------|
class SurveyQuestion2 {
    let question: String
    var response: String?
    
    init(question: String){
        self.question = question
    }

    func ask() {
        print(question)
    }
}

let qu1 = SurveyQuestion(question: "How was your exam?")
qu1.ask()
qu1.response = "Great"
qu1.response

qu1.question = "new que"
qu1.ask()

//------------------ 7.1 Assiging constant properties ------------------|
//class SurveyQuestion3 {
//    let question: String = "abc"
//    var response: String?
//
////    init(question: String){
////        self.question = question
////    }
////
//    func ask() {
//        print(question)
//    }
//}
//
////let qu1 = SurveyQuestion(question: "How was your exam?")
//let que1 = SurveyQuestion(question: "How was your exam?")
//que1.ask()
//que1.response = "Great"
//que1.response
//
//que1.question = "new que"
//que1.ask()

//------------------ 7.2 Default initialiser ------------------|

//Invalid
struct ShoppingListItem {
    var name: String
    var quantity: String
    var purchased: String
}
//var item = ShoppingListItem()

//class ShoppingListItem {
//    var name: String?
//    var quantity = 10
//    var purchased = 1
//}
var item = ShoppingListItem(name: "HDD", quantity: "10", purchased: "Yes")

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {} //default
    
    //initialise from specific points
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    //calc center and calls above initiliser at specific
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init()
    }
}

class Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "")

class A {
    var a: String?
    var b: String?
    
    init() {
        a = "Default"
    }
    
    init(b: String) {
        self.b = "From class A - variable b"
        print(self.b)
    }
}

class B: A {
    
    override init(b: String) {
        super.init(b: "BBB")
        print(b)
       // print("BB")
    }
}

var b = B(b: "Of B overriding")
//print(b.b)

