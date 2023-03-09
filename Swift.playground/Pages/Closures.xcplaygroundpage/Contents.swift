import Foundation

////Valid
//var greet: (String, String) -> String = {
//    "\($0), \($1)"
//}
//greet("Good", "Morning")

//Invalid
//var greet2 = {
//    (s1: String, s2: String) -> String in
//    return "\($0), \($1)"
//}

//greet2("Good", "Morning")

//Invalid
//var greet = {
//    "\($0), \($1)"
//}
//greet("Good", "Morning")


//Closures with optional - parenthesis required
var wishBirthday: ((String) -> String)? = {
    "\($0)"
}

//var wishBirthday2: (String) -> (String) = {
//    "Happy birthday, \($0)"
//}

wishBirthday?("Shubham")

//First way
//if wishBirthday != nil {
//    print("Inside")
//}

//Second way
//if let wish = wishBirthday?("Shubh"){
//    print("Inside 2")
//}

//var bDay: String? = "Shubham"
//var name = "Shubham"
//if let wish = name {
//    wishBirthday(wish)
//}
//

//func then(onFulfilled: ()->(), onReject: (()->())?){
//    onFulfilled() //Calling closure
//
//    if onReject != nil {
//      print("On reject called ...")
//    }
// }
//
//
////With nil
//then(onFulfilled: {
//    print("Fullfiled")
//}, onReject: nil)
//
////Without nil
//then(onFulfilled: {
//    print("Fullfiled")
//}, onReject: {
//    print("Fullfiled")
//})


//Escaping

//var arrayClosure: [() -> ()] = []
//
//func escapingClosure(name: String, closure: @escaping () -> ()) {
//    print("\(name)")
////    closure() //Calling closure - by default non escaping
//    arrayClosure.append(closure)
//}
//
//escapingClosure(name: "Shubham", closure: {
////    lastName in
//    print("Calling closure")
//})
//
//arrayClosure[0]



//Capturing values

//Prints same value - this is over writing its previous value because of reference
var i = 0
var closureArray = [() -> ()]()
for _ in 1...3 {
    closureArray.append { print(i) }
    i += 1
}

closureArray[0]()
closureArray[1]()
closureArray[2]()
//closureArray[4]()

//Prints the value of j - not over writing prev value
//Capturing individual values
//var j = 0
//var closureArray2 = [() -> ()]()
//for _ in 1...5 {
//    closureArray2.append { [j] in print(j) }
//    j += 1
//}
//closureArray2[0]()
//closureArray2[4]()

//Example 2: Doc
//func makeIncrementer(forIncrement amount: Int) -> () -> Int {
//    var runningTotal = 0
//    func incrementer() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return incrementer
//}
//
////Demonstrate: Both are independent and have their own copy
//let incrementByTen = makeIncrementer(forIncrement: 10)
//incrementByTen() //10
//
//let incrementBySeven = makeIncrementer(forIncrement: 7)
//incrementBySeven() //7
//incrementByTen() //20\
//
//let alsoIncrementBySeven = incrementByTen
//alsoIncrementBySeven()
//incrementByTen()

//Escaping
var completionHandlers: [() -> Void] = []
var temp: String = "default"

func escapingClosures(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
//        temp = "Shubham"
//    completionHandler()
}

escapingClosures(completionHandler: {
    temp = "closure 0";
    print(temp)
})
escapingClosures(completionHandler: {
    temp = "closure 1"
    print(temp)
})
escapingClosures(completionHandler: {
    temp = "closure 2"
    print(temp)
})
//escapingClosures { temp = "Closure 1" }

completionHandlers[0]()
completionHandlers[1]()
completionHandlers[2]()


print("Final: ", temp)
print(completionHandlers)

var name = Array(1...100)


