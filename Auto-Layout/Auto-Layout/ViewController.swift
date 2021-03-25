import UIKit

class ViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .systemTeal
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = view.center
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

