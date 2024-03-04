import UIKit
import SwiftUI

final class MainViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("터치!", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func tappedButton() {
        let addressViewController = UIHostingController(rootView: AddressView())
        present(addressViewController, animated: true)
    }
}
