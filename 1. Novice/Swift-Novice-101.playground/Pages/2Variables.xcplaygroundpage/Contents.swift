/*:

### 2. Variables

Declare and use variables and constants
****

*/
import Darwin

// Constant (immutable)
let π = 3.14159

// Variable (mutable)
var radius = 2.5

// varibles can be printed using the format below

let area = π*pow(radius,2)

print("The circle has an area of \(area) and a perimeter \(2*π*radius)")

// switches can be applied to variables of String type
let fruit = "apple"
switch fruit {
case "orange":
    print("Orange juice is cool")
case "apple", "strawberry":
    print("I just love red and green")
case let x where x.hasSuffix("ango"):
    print("Here we go")
default:
    print("Nothing to see here, move along.")
}

// variables can be coupled in tupples. A tupple has two or more variables

let tupple = (distance : 2.0, name : "red track")
print("The \(tupple.name) has \(tupple.distance) kilometers")

// for-in loop (Also tuples)
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]
var largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
largest
largestKind



/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

