import UIKit

final class SecondViewController: UIViewController {
    static let identifier = "SecondViewController"
    
    private let text: String
    
    init?(coder: NSCoder, text: String) {
        self.text = text
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        print(text)
    }
}
