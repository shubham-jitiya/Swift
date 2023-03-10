import Foundation


//Defining a base class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        //Do nothing for  now
    }
}

let someVehicle = Vehicle()
print(someVehicle.currentSpeed)
print(someVehicle.description)

//subclassing
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.currentSpeed
bicycle.hasBasket

bicycle.currentSpeed = 15.0
bicycle.currentSpeed

//Tandem inherits bicycle, bicycle inherits vehicle
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0

print(tandem.hasBasket)
print(tandem.currentNumberOfPassengers)
print(tandem.currentSpeed)

//Overriding - functions
class Train: Vehicle {
    
    //overriding
    override func makeNoise() {
        print("Choo... Choo...")
    }
}

let train = Train()
train.makeNoise()

//Overriding - computed properties
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed
car.gear = 3
print(car.description)


//Property observer
final class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0

print("Automatic Car: \(automatic.description)")

//Prevent overriding - can not override if automatic car is final
//class Tesla: AutomaticCar {
//
//}


//Super: Call parent class using
class Animal {
    var name = "Animal property" //stored properties can't be override
    var findType: String {
        return "\(name)"
    }
    
    func getInfo() -> Void {
        //super.getInfo() //Gives error because it does not have parent class
        print("From animal")
    }
}

//let animal = Animal()
//animal.getInfo()

class Dog: Animal {
    var newAnimal = "Dog property"
    override var findType: String {
        return "\(newAnimal)"
    }
    
    override func getInfo() -> Void {
        super.getInfo() //calls parent class
        print("From Dog")
    }
}

//let dog = Dog()
//dog.getInfo()

class GoldenRetriver: Dog {
//    override var name: String {
//        willSet {
//            name = "Pet"
//        }
//    }
    override func getInfo() -> Void {
        super.getInfo() //calls parent class - if it has super class in its method then again it calls its parent class
        print("From golden retriver")
    }
}

let pet = GoldenRetriver()
pet.getInfo()
pet.name
pet.findType

func returnTuple() -> (Int, Int){
    var tup = (10, 20)
    return tup
}

var test = returnTuple()
print(test.1)

