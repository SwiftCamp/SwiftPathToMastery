/*:

### 1. Protocols
Use and understand Swift's Protocols
 
More info [here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html)
****
*/
// Simple Protocol

import UIKit

protocol SimpleProtocol {
    func doSomething()
}


// Protocols can't have storage types, only computed
protocol ComputedPropertiesProtocol {
    var computedVar: String { get set }
}

// Protocols can extend other protocols
protocol ExtendedProtocol: SimpleProtocol { }
/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

