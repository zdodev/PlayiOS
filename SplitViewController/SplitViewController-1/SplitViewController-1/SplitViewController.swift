import UIKit

class SplitViewController: UISplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .systemBlue
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .systemRed
        
        setViewController(firstViewController, for: .primary)
        setViewController(secondViewController, for: .secondary)
        
        show(.primary)
    }
}
