import Foundation


//Escaping closure
//var completionHandlers: [() -> Void] = []
//var completionHandlers: [() -> ()] = []
//var greetMorning = {
//    print("Good morning...")
//}
//var greetEvening = {
//    print("Good evening...")
//}
//var greetNight = {
//    print("Good night...")
//}
//
//completionHandlers.append(greetMorning)
//completionHandlers.append(greetEvening)
//completionHandlers.append(greetNight)
//
////type(of: completionHandlers)
////print(completionHandlers)
//completionHandlers[0]

func findMin(array: [Int]) -> (min: Int, Int)? {
    if array.isEmpty { return nil }
    
    guard let currentMin = array.min(), let currentMax = array.max() else {
        return nil
    }
    return (array.sorted(by: <)[0], array.sorted(by: <)[array.count - 1])
    //return (currentMin, currentMax)
}

findMin(array: [5, 4, 2, 1])

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let sortedNames = names.sorted(by: {
    (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//omiting parameter types
let sortedNames2 = names.sorted(by: { (s1, s2) -> Bool in return s1 > s2
})
//sortedNames runs 9 times, sortedNames runs 10 times?
print(sortedNames2)

//no need of return
let sortedNames3 = names.sorted(by: { (s1, s2) -> Bool in s1 > s2
})
print(sortedNames3)

//skip in
let sortedNames4 = names.sorted(by: { $0 > $1 })
print(sortedNames4)

//skip everything
let sortedNames5 = names.sorted(by: >)
print(sortedNames5)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]


digitNames[16/10 % 10]


//Closures

//Inout - update name
var tempName = "Shubham"
func changeName(name: inout String) {
    name = "Name updated"
    //return name
}
changeName(name: &tempName)
print(tempName) //check original value, changed
//

//inout - Swap num
var num1 = 100, num2 = 20
print("Before Swap: ", num1, num2)

func swapNums(n1: inout Int, n2: inout Int) {
    var n3 = n1
    n1 = n2
    n2 = n3
}

swapNums(n1: &num1, n2: &num2)
print("After Swap: ", num1, num2)
