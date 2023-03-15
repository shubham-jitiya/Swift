import Foundation

//0. general

//protocol Engine {
//    func startEngine()
//    func stopEngine()
//}
//
//protocol SpeedControl {
//    func increaseSpeed()
//    func decreaseSpeed()
//}
//
//protocol Safety {
//    func releaseAirBags()
//    func appyEmergencyBrakes()
//}
//
//protocol Car: Engine, SpeedControl, Safety {
//    func applyBrakes()
//}
//
//class SportsCar: Car {
//    func applyBrakes() {
//        print("Applying brakes")
//    }
//
//    func startEngine() {
//        print("Starting engine of sports car")
//    }
//
//    func stopEngine() {
//        <#code#>
//    }
//
//    func increaseSpeed() {
//        <#code#>
//    }
//
//    func decreaseSpeed() {
//        <#code#>
//    }
//
//    func releaseAirBags() {
//        <#code#>
//    }
//
//    func appyEmergencyBrakes() {
//        <#code#>
//    }
//
//
//}


//docs
//1. property req - gettable & settable
protocol SomeProtocol {
    var mustBeSatable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//2. always define with static
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

//3. Protocol example - single instance
protocol FullyNamed {
    var fullName: String { get }
}

//struct adopts FullyNamed - must have property defined in protocol
struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

//Ex. Property requirement
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    //Computed read-only
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)


//2. Method Requirements -----------|
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here is the random number: \(generator.random())")

//3. Mutating method requirement
//Mutating keyword: only - structures and enumerations

protocol Toggalable {
   mutating func toggle()
}

enum OnOffSwitch: Toggalable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

//4. Initializer Requirements
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1

    }
}

//with extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)


//Check equality by adopting equitible
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

//Protocol inheritance
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextDescription: String { get }
}

//Limit to class only - not struct & enum
//
//protocol SomeProtocol: AnyObject, InheritedProtocol {
//
//}


//conform multiple protocols at same time

