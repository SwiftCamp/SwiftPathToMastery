/*:

### 2. Extensions

More info [here](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html#//apple_ref/doc/uid/TP40014097-CH24-ID151)
****

*/
import UIKit

extension UIView {
    var className : String {
        return String(self.dynamicType)
    }
}

print(UIButton(frame: CGRect.zero).className)
print(UISlider(frame: CGRect.zero).className)
/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

