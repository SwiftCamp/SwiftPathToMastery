/*:

### Object Casting

Cast objects safely from one type to another

More info [Here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TypeCasting.html#//apple_ref/doc/uid/TP40014097-CH22-ID338)
****

*/
class SuperClass {
    let superClassProperty : Int = 0
}

class SubClassOne: SuperClass {
    let x : Int = 1
}

class SubClassTwo: SuperClass {
    let x : Int = 2
}

let one = SubClassOne()
let two = SubClassTwo()

var test : SuperClass = one

if let one = test as? SubClassOne {
    print(one.x)
}

if let two = test as? SubClassTwo {
    print(two.x)
}

test = two

if let two = test as? SubClassTwo {
    print(two.x)
}


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

