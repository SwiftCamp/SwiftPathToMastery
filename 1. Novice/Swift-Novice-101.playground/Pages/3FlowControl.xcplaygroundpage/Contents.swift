/*:

### 3. Flow Control

Handle flow control and looping constructs

More info [Here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)
****

*/
// Flow Control

for i in 0...5 { print(i) }
for i in 0..<5 { print(i) }

let flowArray = [1, 2, 3, 4, 5]
for i in 0..<flowArray.count { print(flowArray[i]) }
for i in flowArray { print(i) }

// Reverse counting
for i in 5.stride(to: 1, by: -1) { print(i) }

let someString = "String"
switch someString {
case "String": print("Got Them!")
case "Ze": print("Nop")
default: print("Oops!!")
}

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

