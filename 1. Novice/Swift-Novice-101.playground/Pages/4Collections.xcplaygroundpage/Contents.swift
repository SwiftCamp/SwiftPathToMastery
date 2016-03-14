/*:

### Collections

Create and use collections

More info [Here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105)

*/
// Arrays and Mutability

let someArray = [1, 2, 3, 4, 5]

// Subscripting is not a safe operation
let value = someArray[1]

// Check before accessing the element in the array
let index = 1
if someArray.count > index { let anotherValue = someArray[index] }

// An array declared as let becomes imutable
// Error: someArray.append(6)

// Explicit type empty array allows the usage of the append method
var emptyArray: [Int] = []
emptyArray.append(2)

// Transforming Arrays
let squareOfSomeArray = someArray.map { $0 * $0 }

// Sets stores distinct values of the same type in a collection with no defined ordering.
var newSet = Set<Character>()
newSet.insert("a")
newSet.insert("Z")

// Declaring Explicit Set
var explicitSet: Set = [1, 2, 3]
explicitSet.remove(2)
explicitSet.contains(3)

// More about Sets --> http://andybargh.com/swift-sets/

// Dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering
var newDictionary = [String: Int]()
newDictionary["Key"] = 1
newDictionary.updateValue(2, forKey: "Key")




/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

