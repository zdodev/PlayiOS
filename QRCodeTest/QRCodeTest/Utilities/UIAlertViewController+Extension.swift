import UIKit

extension UIAlertController {
    static func alertController(_ title: String, _ message: String, _ buttonString: String) -> UIAlertController {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonString, style: .default)
        alertViewController.addAction(alertAction)
        return alertViewController
    }
}
