import UIKit

final class ViewController: UIViewController {
    // 코드 베이스
    @IBAction func tapFirstButton(_ sender: UIButton) {
        let first = "First"
        let firstViewController = FirstViewController(text: first)
        present(firstViewController, animated: true)
    }
    
    // 스토리보드 베이스
    @IBAction func tapSecondButton(_ sender: UIButton) {
        let second = "Second"
        let secondViewController = UIStoryboard(name: "Main", bundle: .main)
            .instantiateViewController(
                identifier: SecondViewController.identifier) { coder in
                    SecondViewController(coder: coder, text: second)
                }
        present(secondViewController, animated: true)
    }
}
