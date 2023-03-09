import Foundation

//----------------- 1. Basics -----------------
//Enumeration - custom data type of related values
//common type for a group of related values

//Define enum
enum Season {
    case spring, summer, autumn, winter //Define enum variables
}

//Create variable of type enum - Season
var currentSeason: Season

//Assign value - Can only store spring, summer, autumn, winter as above
currentSeason = Season.summer

//Type inference
var newSeason = Season.summer

print(currentSeason)
print(newSeason)

//----------------- 2. Enum with switch statement -----------------

enum PizzaSize {
    case small, medium, large
}

var size = PizzaSize.medium

//no default case
switch size {
case .small:
    print("Ordered small sized pizza")
case .medium:
    print("Ordered medium sized pizza")
case .large:
    print("Ordered large sized pizza")
}

//----------------- 2.1 Enum with switch statement & default -----------------
//If we can't cover all the cases then we need to give default case in enum

enum PizzaSize2 {
    case small, medium, large
}

var size2 = PizzaSize.large

//no default case
switch size2 {
case .small:
    print("Ordered small sized pizza")
case .medium:
    print("Ordered medium sized pizza")
default:
    print("Default: Ordered large sized pizza")
}

//----------------- 3. Iterate over enum clases -----------------

enum Season2: CaseIterable {
    case summer, winter, monsoon
}

for currentSeason in Season2.allCases {
    print(currentSeason)
}

//----------------- 4. Swift enums with raw values -----------------

enum Size: Int {
    case small = 100
    case medium = 200
    case large = 300
}

//Access raw values
Size.small.rawValue

//----------------- 5. Swift enum Associated Values -----------------

enum Laptop {
    //Associate value
    case name(String)
    case price(Int)
    //case name(Int) // Error - redeclaration
}

var brand = Laptop.name("Acer aspire 7")
print(brand)

//=====================================================================

//----------------- 1. Swift enum Associated Values -----------------

//Additional information
enum Distance {
    case km(String) //km is associated with string value, km can only be string
    case miles(String)
}

print(Distance.km("Metric system"))
print(Distance.km("Imperial system"))

//----------------- 2. Associate Multiple Values (Tuples) -----------------
enum Marks {
    case gpa(Double, Double, Double)
    case grade(String, String, String)
}

var marks1 = Marks.gpa(8.5, 8.1, 5.5)
var marks2 = Marks.grade("A", "A", "C")

//----------------- 3. Name to associated value -----------------

enum Pizza2 {
    case small(inches: Int) //same as giving label to tuppels
    case medium(inches: Int), large(inches: Int)
}

var order = Pizza2.large(inches: 12)
print(order)

//----------------- 4. Name to associated value -----------------
enum Mercedes {
    case seden(height: Double)
    case suv(height: Double)
    case roadster(height: Double) //can also be written in one line
}

var choice = Mercedes.suv(height: 5.4)

//which enum to call is defined by the above line
//let binds the associted value so that we can use it in print statement
switch choice {
case let .seden(height):
    print("Height: ", height)
case let .suv(height):
    print("Height: ", height)
case let .roadster(height):
    print("Height: ", height)
}

//----------------- 5. Raw value vs associated values -----------------
//raw values
// - predefined constant values
// - common values to all variables inside enum
// - defined after name of enum

//Associated values
// - var values
// - different values associated with each var
// - defined inside () for each var

//Ex. Raw values
enum Vehicle1: String {
    case car = "Four wheeler"
    case bike = "Two wheeler"
}

//Ex. Associated values
enum Vehicle2 {
    case car(String)
    case bike(String)
}

//Can not have both: raw + associated
//Raw values must be of same data type inside enum
//while associated value can have of any type

//----------------- Enums with methods -----------------

enum WeekDay: String {
    case monday
    case tuesday
    
    func day() -> String { return "Today is: \(self.rawValue)" }
}

print(WeekDay.monday.day())
print(WeekDay.tuesday.day())

//----------------- User defined values & auto increment -----------------
//Give default value
//When integers are used for raw values, they auto-increment from previous value if no value is specified.
enum Genres: Int, CaseIterable {
case One = 1001, Two, Three, Four, Five
}

for genre in Genres.allCases {
    print(genre.rawValue)
}

//----------------- Enums with variables -----------------
enum Weekday {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
    //Computed property
    var dayType: String {
        self == .Saturday || self == .Sunday ? "Weekend" : "Weekday"
    }
}

Weekday.Monday.dayType
Weekday.Saturday.dayType
Weekday.Sunday.dayType

//----------------- Recursive enumeration -----------------

//1 - way
//indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//2 - way
//Declare
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression) //(5 + 4) * 2
}

//Initialise values of type arithmetic expression
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)

let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

//function which calculates
func evalute(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evalute(left) + evalute(right)
    case let .multiplication(left, right):
        return evalute(left) * evalute(right)
    }
}

print(evalute(sum))
print(evalute(product))


//----------------- Enum with variables -----------------

//Ex. 2
enum Vehicle {
    case bike
    case car
    
    var type: String {
        self == .bike ? "You got bike!!" : "Car is not available for now"
    }
}

var vehicle = Vehicle.bike.type
var vehicle2 = Vehicle.car.type


//=====================================================================



//----------------- 1. Structs -----------------
//If we want to do same things for multiple times
//eg. storing name and age of 1000 people

//blueprint
struct Person {
    
    //properties
    var name = " "
    var age = 0
}

//create instance
var person1 = Person()
var person2 = Person()

//modify properties
person1.name =  "Shubham"
person1.age = 20

print("Person 1 = Name: \(person1.name) | Age: \(person1.age)")
print("Person 2 = Name: \(person2.name) | Age: \(person2.age)")

//----------------- 2. Memberwise initializer -----------------

struct Person2 {
    var name: String = " " //still use if already assigned
    var age: Int
}

var p1 = Person2(name: "Shubham", age: 20)
print("Person 1 = Name: \(p1.name) | Age: \(p1.age)")

//----------------- 3. Functions inside struct -----------------
struct Car {
    var gear = 0
    
    func applyBreaks() -> Void {
        print("Applying hydraulic brakes")
    }
}

var car1 = Car()
car1.applyBreaks()
car1.gear = 5
