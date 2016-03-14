/*:

### Functions

Develop and use simple functions

More info [Here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID158)

****

*/
import UIKit

func simpleFunction() {
    print("Simple Function")
}

simpleFunction()

func parameterFunction(name: String) {
    
    print("Parameter Function, " + name + "!")
}

parameterFunction("Parameter")

func parameterFunctionWithReturn(name: String) -> String {
    
    let text = "Parameter Function, " + name + "!"
    
    return text
}

print( parameterFunctionWithReturn("Parameter") )

func parameterFunctionWithReturnExternalAndLocal(externalName internalName: String) -> String {
    
    let text = "Parameter Function, " + internalName + "!"
    
    return text
}

print( parameterFunctionWithReturnExternalAndLocal(externalName: "Parameter") )

func parameterFunctionWithReturnOmmitingExternalAndLocal(internalName: String, _ parameterTwo: String) -> String {
    
    let text = "Parameter Function, " + internalName + " " + parameterTwo + "!"
    
    return text
}

print( parameterFunctionWithReturnOmmitingExternalAndLocal("Parameter", "Two") )

func parameterFunctionDefault(name: String = "default name") {
    
    print("Parameter Function, " + name + "!")
}

parameterFunctionDefault()
/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

