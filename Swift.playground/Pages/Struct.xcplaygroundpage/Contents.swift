import Foundation

//struct Resolution {
//    var width
//    var height
//}
//
//class VideoMode {
//    var resolution = Resolution()
//    var interlaced = false
//    var frameRate = 0.0
//    var name: String?
//}

// ------------------ 1. Define class ------------------
class Bike {
    
    //Properties with default values
    var name = " "
    var gear = 0
    
    func isSportsBike() -> Bool { false }
}

//Create Mulitple Objects
var hero = Bike()
var honda = Bike()

//Modify & Access
hero.name = "Pleasure xTech BS6"
hero.gear

//Call Function
hero.isSportsBike()

// ------------------ 2. initializer ------------------
//Assign value - default value assign vs using initializer
class Fruit {
    var name: String
    var price = 0
    
    //Constructor
    init(name: String) {
        self.name = name
    }
    
    //Constructor overloading
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

var kiwi = Fruit(name: "Kiwi")
print(kiwi.name)

var banana = Fruit(name: "Banana", price: 20)
print(banana.price)

// ------------------ 3. value type & reference type ------------------

//Class Type - reference
var test = kiwi
test.name
kiwi.name = "Deleted"
test.name

struct Dog {
    var name = "Golden retriver"
}

//Struct Type - value
var test1 = Dog()
var test2 = test1
test1.name
test1.name = "Updated"
test2.name

// ------------------ 4.0 Properties - stored ------------------
class Person {
    
    //properties
    var name: String = " "
    var age: Int = 0
}

var person1 = Person()

//assign values to properties
person1.name = "Shubham"
person1.age = 0

print(person1.name)

// ------------------ 4.1 Properties - computed ------------------
class Calculator {
    
    //stored property
    var num1 = 0, num2 = 0
    
    //computed property
//    var sum: Int {
//        num1 + num2
//    }
    
    //computed property with getter and setters
    var sum: Int {
       
        //Getters
        get {
            num1 + num2
        }
       
        //Setters
        set(modify) {
            num1 = (modify + 10)
            num2 = (modify + 20)
        }
    }
}

var cal1 = Calculator()
cal1.num1 = 20
cal1.num2 = 50

cal1.sum //access getter
cal1.sum = 5 //access setter
cal1.sum

// ------------------ 5. Static properties ------------------
struct University {
    static var name: String = " "
}

University.name = "GEC - Gandhinagar"

//Can be modified
print(University.name)
University.name = "GEC - Gn"
print(University.name)

// ------------------ 6. Methods ------------------
class PersonSecond {
    func speaks() -> Void {
        print("Speaks English...")
    }
}

var indianPerson = PersonSecond()
indianPerson.speaks()

// ------------------ 7. Static Methods ------------------
class PersonThird {
    static func speaks() -> Void {
        print("Speaks English... with static")
    }
}

PersonThird.speaks()

// ------------------ 8. self property  ------------------
class Marks {
    var physics = 0
    
    func checkResult(passingMarks physics: Int) {
//        self.physics = physics
//        physics = physics //Error: ambiguity
        print("outside: \(self.physics) inside(local): \(physics)")
        
        //using self
        if self.physics < physics { //28 < 50
            print("Fail")
        } else {
            print("Pass")
        }
    }
}

//var student1 = Marks()
//student1.checkResult(physics: 100) //add label if using this
//student1.physics

//using self
var student2 = Marks()
student2.physics = 28 //refers to instance: student2
student2.checkResult(passingMarks: 50)


// ------------------ 9. mutating  ------------------
class Employee {
    var salary = 0
    
    func incrementSalary(increase: Int) {
        salary = increase //can not do this without mutating keyword, possible in class
    }
}

var emp1 = Employee()
emp1.incrementSalary(increase: 500)
emp1.salary
