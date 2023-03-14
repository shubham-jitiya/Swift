import Foundation

//1. 
class Employee {
    var dept = Department()
    class Department {
        var EmpId = 150
        var EmpName = "Suresh Dasari"
        
        func GetDetails() -> String {
            return "Id: \(self.EmpId), Name: \(self.EmpName)"
        }
    }
}

var emp = Employee()
print(emp.dept.GetDetails())

//2.
class Student {
    enum StudentTypes {
        case Intelligent
        case Good
    }

    func name() -> StudentTypes {
        return .Intelligent
    }

}

class Teacher {
    let student = Student()
    var type: Student.StudentTypes
    init() {
        self.type = self.student.name()
    }

}

var result = Student.StudentTypes.Good
print(result)
