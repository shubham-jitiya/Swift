import Foundation

enum BikeError: Error {
    case insufficientPetrol(neededPetrolQty: Int)
    case invalidAge(neededAge: Int)
}

struct Bike {
    func startPicnic(petrolQuantity: Int) throws -> String {
        if petrolQuantity < 4 {
            throw BikeError.insufficientPetrol(neededPetrolQty: 4)
        }
        return "Continue, keep enjoying ..."
    }
    
    func rideBike(age: Int) throws -> String {
        if age < 18 {
            throw BikeError.invalidAge(neededAge: 18)
        }
        return "You can ride the bike"
    }
}

let bike = Bike()


do {
//   try bike.startPicnic(petrolQuantity: 2)
   try bike.rideBike(age: 12)
} catch BikeError.insufficientPetrol(let needed) {
    print("Insufficient petrol, needed \(needed) ltr")
} catch BikeError.invalidAge(let age) {
    print("You are minor, required age to drive is \(age)")
}

