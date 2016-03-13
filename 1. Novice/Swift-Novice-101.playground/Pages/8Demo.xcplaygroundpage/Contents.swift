/*:

### Demo
*/
let constant = "diogo"
var variable = 2.0

let conversionInches = 39.3701
let conversionFeet = 3.28084

struct Person {
    var name : String? {
        willSet {
            print("new value \(newValue)")
            print("current value \(name)")
        }
        didSet {
            print("old value \(oldValue)")
            print("current value \(name)")
        }
    }
    
    let age : Int
    var height : Double
    
    var heightInFeet : Double {
        get {
            return height * conversionFeet
        }
        set {
            height = newValue * conversionFeet
        }
    }
    
    var heightInInches : Double {
        return height * conversionInches
    }
}

var joao = Person(name: "Joao", age: 26, height: 1.71)
let diogo = Person(name: "Diogo", age: 26, height: 1.80)

joao.name = "Costa"

class Company {
    var name : String?
    var employees : [Person]?
    
    init(name: String, employees: [Person]) {
        self.name = name
        self.employees = employees
    }
}

var bliss = Company(name: "Bliss", employees: [joao, diogo])

//var plizz = bliss
//
//print("\(bliss.name) - \(plizz.name)")
//bliss.name = "plizz"
//print("\(bliss.name) - \(plizz.name)")

//Optionals
var married : String = "coco"
print(bliss.employees?.count)

print("Entrei e married : \(married)")
// optional binding
//if let married = married where married == "coco" {
//    print("Entrei e married : \(married)")
//}

// Nil coalescence
print(married ?? "not defined")

var array = [0,1,2,3,4,5]

array.forEach{ print($0) }


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

