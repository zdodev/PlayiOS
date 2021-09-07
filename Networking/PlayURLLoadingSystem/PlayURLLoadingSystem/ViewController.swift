import UIKit

class ViewController: UIViewController {
    let urlSessionRequest = URLSessionRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlSessionRequest.requestGet()
        urlSessionRequest.requestPost()
        urlSessionRequest.requestPut()
        urlSessionRequest.requestPatch()
    }
}


