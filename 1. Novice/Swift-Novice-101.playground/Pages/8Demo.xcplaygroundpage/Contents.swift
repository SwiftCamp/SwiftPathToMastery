/*:

### Demo
*/
struct Company {
    let name : String
    var employees : [Person]
    
    init(name: String, employees: [Person]) {
        self.name = name
        self.employees = employees
    }
    
    mutating func addEmployee(person : Person){
        employees.append(person)
    }
}


struct Person {
    var name : String {
        willSet {
            print("\(name)")
            print("\(newValue)")
        }
        didSet {
            print("\(name)")
            print("\(oldValue)")
        }
    }
    
    let age : Int
    var height : Double
    
    var heightInInches : Double {
        get { return height * 39.3701 }
        set { height = newValue / 39.3701 }
    }
    
    var heightInFeet : Double {
        return height * 3.28084
    }
    
}

let diogo = Person(name: "Diogo", age: 26, height: 1.80)
var joao = Person(name: "Joao", age: 26, height: 1.71)

var bliss = Company(name: "Bliss", employees: [joao, diogo])
let employees = bliss.employees

var dic : [Int : String] = [:]
let dic2 = Dictionary<Int, String>()
dic[0] = "Joao"
let optionalName : String? = dic[0]

print(optionalName)
// force unwrap NEVER DO!!
print(optionalName!)

// optional binding
if let optionalName = optionalName {
    print(optionalName)
}
// nil coalescence
print(optionalName ?? "No Name")
// optional chaining

// For
/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

