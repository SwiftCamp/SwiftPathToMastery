/*:

### 3. Mixins

Mixins are done by using protocol extensions, good article with more info [here](http://matthijshollemans.com/2015/07/22/mixins-and-traits-in-swift-2/)

****

*/
import UIKit

protocol Verbosity {
    
}

extension Verbosity {
    func debug() {
        print(self)
    }
}

class A: UIView, Verbosity {
    
}

A().debug()
/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

