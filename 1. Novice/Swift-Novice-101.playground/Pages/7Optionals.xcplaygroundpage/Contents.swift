/*:

### Optionals

Handle optionals from APIs and unwrap them safely

More info [Here](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Types.html#//apple_ref/swift/grammar/optional-type) and [Here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245)
****

*/
let optionalWrapped : Int? = 0

//Force unwrap 

print(optionalWrapped!)

// Optional binding

if let optionalUnWrapped = optionalWrapped {
    print(optionalUnWrapped)
}

// Nil coalescence 

print(optionalWrapped ?? 0)

class App {
    
    var name: String = "FeedReader"
}

class Source {
    
    var feeds:Int = 100
    
    var reader: App? = nil
}


var source = Source()

print("There are \(source.feeds) feeds.")

print("The reader for this source is \(source.reader?.name).")


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

