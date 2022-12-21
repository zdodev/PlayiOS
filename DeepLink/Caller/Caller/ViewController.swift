import UIKit

final class ViewController: UIViewController {
    private var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlScheme = "myAppA"
        let name = "라이언"
        let age = 18
        let urlString = "\(urlScheme)://navigation?name=\(name)&age=\(age)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        url = URL(string: urlString)
    }
    
    @IBAction func tappedOpenButton(_ sender: UIButton) {
        if let url = url {
            Task {
                await view.window?.windowScene?.open(
                    url,
                    options: nil
                )
            }
        }
    }
}
