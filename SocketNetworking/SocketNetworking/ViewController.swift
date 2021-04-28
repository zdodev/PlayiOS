import UIKit

final class ViewController: UIViewController {
    private let chatNetwork = ChatNetwork()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatNetwork.connectChat()
    }
}

