import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AnalyticsService.logEvent(.tappedButton(.init(name: "🔥")))
        print("e")
    }
}

