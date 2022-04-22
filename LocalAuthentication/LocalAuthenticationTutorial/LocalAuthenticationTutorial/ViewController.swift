import UIKit
import LocalAuthentication

final class ViewController: UIViewController {
    private var laContext = LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedLoginButton(_ sender: UIButton) {
        laContext = LAContext()
        
        var error: NSError?
        if laContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            laContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "계정 로그인") { isSuccess, error in
                if isSuccess {
                    DispatchQueue.main.async {
                        self.login()
                    }
                }
            }
        } else {
            if let error = error {
                print(error)
            }
        }
    }
    
    private func login() {
        let alertViewController = UIAlertController(title: "성공", message: "로그인 성공", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alertViewController.addAction(alertAction)
        present(alertViewController, animated: true)
    }
}

