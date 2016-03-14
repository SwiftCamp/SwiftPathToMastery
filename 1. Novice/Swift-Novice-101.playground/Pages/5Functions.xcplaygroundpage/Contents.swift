/*:

### Functions

Develop and use simple functions
****

*/
import UIKit


// Functions are self-contained chunks of code that perform a specific task.
// You give a function a name that identifies what it does, and this name
// is used to “call” the function to perform its task when needed.

// This is a simple function called "sayGameOver". It takes no arguments and
// returns no value.
func sayGameOver() {
    
    print("Game Over!")
}

sayGameOver()

//------------------------------------------------------------------------------

// A function can be more useful if we pass it additional information.

// By passing a String argument value in parentheses, this function can print a
// a customized game over message that includes the player's name.

func sayGameOver2(name: String) {
    
    print("Game Over, " + name + "!")
}

sayGameOver2("Robert")

//------------------------------------------------------------------------------

// Functions can also do work and return the result of that work as a return
// value.

// This version of our function does not print a message but returns is as a
// String, which other code can use.

func sayGameOver3(name: String) -> String {
    
    let text = "Game Over, " + name + "!"
    
    return text
}

print( sayGameOver3("Robert") )
print( sayGameOver3("Jennifer") )

//------------------------------------------------------------------------------

// Functions can have more than one argument. This function takes two arguments:
// one that is a String for the player's name and a second one that is an Int
// which represents the player's score.

func sayGameOver4(name: String, score: Int) -> String {
    
    let text = "Game Over, \(name)! Your final score is \(score)"
    
    return text
}

// To call this function, we can pass just a String for the name, but for the
// second argument, we must specify the argument's name when we pass the
// argument's value.

print( sayGameOver4("Kim", score: 2500) )
print( sayGameOver4("Charles", score: 2000) )


//------------------------------------------------------------------------------


// If we want to, we can specify special External Parameter Names which are only
// used when calling the function

// You write an external parameter name before the local parameter name it
// supports, separated by a space.

// The function below specifes both external and internal parameter names for
// both of its argiments.

func sayGameOver5(playersName name: String, playersScore score: Int) -> String {
    
    // The internal names must be used inside the function.
    let text = "Game Over, \(name)! Your final score is \(score)"
    
    return text
}

// The external names must be used when calling the function.
print( sayGameOver5(playersName: "Rick", playersScore: 1900) )
print( sayGameOver5(playersName: "Debbie", playersScore: 3000) )


//------------------------------------------------------------------------------

// Omitting External Parameter Names

// If you do not want to use an external name for the second or subsequent
// parameters of a function, write an underscore (_) instead of an explicit
// external name for that parameter.

func sayGameOver6(name: String, _ score: Int) -> String {
    
    let text = "Game Over, \(name)! Your final score is \(score)"
    
    return text
}

// Now, we can call the function with out having to specify any argument names.
print( sayGameOver6("Kim", 2500) )
print( sayGameOver6("Charles", 2000) )


//------------------------------------------------------------------------------

// Default Values

// You can define a default argument value for any parameter in a function
// by assigning a value to the parameter after that parameter's type.
// If a default value is defined, you can omit that parameter when calling
// the function.

func someFunction(someValue: Int = 42) {
    
    print(someValue)
}

someFunction(6)
someFunction()

// Functions with Multiple Return Values

// You can use a tuple type as the return type for a function to return multiple
// values as part of one compound return value.

// The example below defines a function called findMinMax, which finds the
// smallest and largest numbers in an array of Int values.

func findMinMax(array: [Int]) -> (min: Int, max: Int) {
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1 ..< array.count] {
        
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let bounds = findMinMax([8, -6, 2, 109, 3, 71])

print("The min is \(bounds.min) and the max is \(bounds.max)")


//------------------------------------------------------------------------------


// We can also use the keyword typealias to name tuple types. We can then use
// these name as a return type for our own functions.

typealias Response = (code: Int, message: String)

func getPlayerDataFromServer() -> Response {
    
    // Lets pretend that we got that the player's data!
    return (200, "OK")
}

let responseCode: Response = getPlayerDataFromServer()

print(responseCode)


//------------------------------------------------------------------------------


// Variadic Parameters

// A variadic parameter allow us to pass zero or more values of a specified
// type, and then get access to them.

func addAllNumbers(numbers: Int...) -> Int {
    
    var total: Int = 0
    
    for number in numbers {
        total += number
    }
    
    return total
}

addAllNumbers(1, 2, 3, 4, 5)

//------------------------------------------------------------------------------

// Constant and Variable Parameters

// Function parameters are constants by default. Trying to change the value of
// a function parameter from within the body of that function results in a
// compile-time error. This means that you can’t change the value of a
// parameter by mistake.

// However, if you really want to modify a parameter you can use the var keyword
// allow it

func sayHello(var originalString: String) -> String {
    
    // The parameter testString can be modified
    originalString = "Hello, " + originalString + "!"
    
    return originalString
}

var text = "world"
var newText = sayHello(text)

print( newText )

// NOTE
// The changes you make to a variable parameter inside the function do not
// persist once the function call ends.


//------------------------------------------------------------------------------

// In-Out Parameters

// Variable parameters, as described above, can only be changed within the
// function itself. If you want a function to modify a parameter's value, and
// you want those changes to persist after the function call has ended, define
// that parameter as an in-out parameter instead.

func addHello(inout originalString: String) {
    
    // The parameter testString can be modified
    originalString = "Hello, " + originalString + "!"
}

text = "world"

addHello( &text )

print(text)


//------------------------------------------------------------------------------

// Here's another example of using In-Out Parameters:

func swapTwoInts(inout a: Int, inout _ b: Int) {
    
    let temp = a // Let 'temp' hold the value of 'a'.
    a = b        // Set 'a' to whatever 'b' is.
    b = temp     // Finally, set 'b' to what 'a' was.
}

var myFirstInt = 42
var mySecondInt = 55

swapTwoInts( &myFirstInt, &mySecondInt )

print("myFirstInt is now \(myFirstInt), and mySecondInt is now \(mySecondInt)")


//------------------------------------------------------------------------------

// Nested Functions

// It's possible to declare a function inside another function and then use it!

func processNumbers(number1: Int, _ number2:Int) -> Int {
    
    func add(a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    return add(number1, number2)
}

let result = processNumbers(1, 2)

print(result)

//------------------------------------------------------------------------------

// It's also possible to declare functions inside of another function
// and then return it so it can be used externally.

func getCustomFunction(functionId: Int) -> (Int, Int) -> Int {
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func subtract(a: Int, b: Int) -> Int {
        return a - b
    }
    
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    func divide(a: Int, b: Int) -> Int {
        return a / b
    }
    
    if functionId == 0 {
        return add
    } else if functionId == 1 {
        return subtract
    } else if functionId == 2 {
        return multiply
    } else {
        return divide
    }
}

let computeFunction = getCustomFunction(0)

var answer = computeFunction(1, 2)

print(answer)


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

