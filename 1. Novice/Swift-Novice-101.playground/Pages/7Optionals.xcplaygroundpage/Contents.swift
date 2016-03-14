/*:

### Optionals

Handle optionals from APIs and unwrap them safely
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

