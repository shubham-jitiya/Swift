import Foundation

class Human {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

class House {
    var human: Human?
}

var houseObj = House()
houseObj.human = Human(age: 10)

//Access age
let ageOfHuman = houseObj.human?.age //this return optional int, even though my age is not optional
print(ageOfHuman)

