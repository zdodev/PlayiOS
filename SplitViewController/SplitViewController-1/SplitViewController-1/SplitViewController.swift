import UIKit

final class SplitViewController: UISplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

        let firstViewController = UINavigationController(rootViewController: UIViewController())
        firstViewController.view.backgroundColor = .systemRed
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .systemBlue
        setViewController(firstViewController, for: .primary)
        setViewController(secondViewController, for: .secondary)
        preferredPrimaryColumnWidthFraction = 1 / 3
        preferredDisplayMode = .oneBesideSecondary
        splitViewControllerStyle()
    }
    
    private func splitViewControllerStyle() {
        switch style {
        case .unspecified:
            print("SplitViewControllerStyle: unspecified.")
        case .doubleColumn:
            print("SplitViewControllerStyle: doubleColumn.")
        case .tripleColumn:
            print("SplitViewControllerStyle: tripleColumn.")
        @unknown default:
            fatalError()
        }
    }
}

extension SplitViewController: UISplitViewControllerDelegate {
}
