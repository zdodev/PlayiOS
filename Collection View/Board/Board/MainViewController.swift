import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Project Manager"
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .add), animated: true)
    }
}

