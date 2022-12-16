import UIKit

final class FirstViewController: UIViewController {
    private let text: String
    
    init(text: String) {
        self.text = text
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        print(text)
    }
}
