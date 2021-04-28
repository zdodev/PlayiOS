import UIKit

final class ViewController: UIViewController {
    private let chatNetwork = ChatNetwork(username: "zdo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatNetwork.connectChat { result in
            if result == .failure(.connectionFail) {
                let alert = UIAlertController(title: "네트워크 실패", message: "연결 메시지 전송 실패", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                present(alert, animated: true)
            }
        }
    }
}

