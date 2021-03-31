import UIKit

class MainViewController: UIViewController {
    let uiview = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiview.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        uiview.backgroundColor = .black
        view.addSubview(uiview)
    }
}

