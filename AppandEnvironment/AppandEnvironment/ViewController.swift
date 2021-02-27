import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let subView = UIView()
        subView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        subView.backgroundColor = .systemTeal
        view.addSubview(subView)
    }
}

