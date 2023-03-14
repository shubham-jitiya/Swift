import Foundation

class Person
{
    var name: String
    var job: Job?

    init(name: String) {
        print("init method of Person called")
        self.name = name
    }

    func printName() {
        print("name is \(name)")
    }

    deinit {
        print("deinit called for person class")
    }
}

var objPerson1: Person?
var objPerson2: Person?

//if (1 == 1) {
//    let objPerson = Person(name: "Shubham")
//    objPerson1 = objPerson
//    objPerson2 = objPerson
//    objPerson.printName()
//}

//objPerson1 = nil
//objPerson2 = nil
////objPerson = nil

class Job {
    var jobDescription: String
    var person: Person?

    init(jobDescription: String) {
        print("init method of Job called")
        self.jobDescription = jobDescription
    }

    deinit {
        print("deinit called for job class")
    }
}

if (1 == 1) {
    let objPerson = Person(name: "Shubham2")
    let objJob = Job(jobDescription: "swift programmer")
    objPerson.job = objJob
    objJob.person = objPerson
}
