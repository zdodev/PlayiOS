import ModernRIBs
import UIKit

protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {
    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
    }
    
    func present(viewController: any ViewControllable) {
        present(viewController.uiviewController, animated: true)
    }
}
