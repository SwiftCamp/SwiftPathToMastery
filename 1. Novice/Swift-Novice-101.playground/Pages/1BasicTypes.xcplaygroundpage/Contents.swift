/*:

### 1. Basic Types
Use and understand Swift's basic types like Bool, Int, String, and Double
****
*/
// Swift is a type-safe language. This means that we need to tell Swift what
// types our variables or constants are supposed to be. This way, if part of
// our code expects a String, we can’t pass it an Int by mistake.

// Explicitly declared

let name : String = "John"
let age : Int = 26
let height : Double = 1.71
let married : Bool = false

// Type inferred by Swift

let surname = "Smith"
let siblings = 2
let weight = 78.6
let employed = true

//NOTE: Float point numbers will always be inferred as Double, careful when you wan another type such as Float, or CGFloat etc..

// To access the type of the constant/variable
print(surname.dynamicType)
print(siblings.dynamicType)
print(weight.dynamicType)
print(employed.dynamicType)

// Arithmetic Operators apply to numerical basic types, both operands must have the same type

var testVar1 = 1 + 2
let testVar2 = 2.7 - 3.1
let testVar3 = 2 * Int(3.1)
let testVar4 = 9.0 / Double(2)

testVar1 += 5

testVar1 -= 5

testVar1 *= 5

testVar1 /= 5

//NOTE: Strings can be added using the adding operators


var fullname = name + " "
fullname += surname

print(fullname)

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

