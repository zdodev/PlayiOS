import UIKit

class ViewController: UIViewController {
    let view1: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        view.backgroundColor = .systemRed
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(view1)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var responder = view1.next
        
        // 최하위 뷰의 next responder
        print(responder!)
        while let nextResponder = responder?.next {
            print(nextResponder)
            responder = nextResponder
        }
    }
}
