/*:

### Demo

*/
import UIKit

extension UIColor {
    enum Colors: Int {
        case Red = 0xEA524B
        case Pink = 0xDCBBDC
    }
    
    convenience public init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(color: Colors) {
        self.init(hex: color.rawValue)
    }
}

let red = UIColor(color: .Red)

protocol ShowAlerts {
}

extension ShowAlerts where Self: UIViewController {
    
    func showAlertWithTitle(title: String, message: String) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .Alert
        )
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { _ in }
        
        alertController.addAction(OKAction)
        presentViewController(alertController, animated: true) { }
    }
}

class ViewController: UIViewController, ShowAlerts {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        showAlertWithTitle("Title", message: "Message")
    }
}

/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

