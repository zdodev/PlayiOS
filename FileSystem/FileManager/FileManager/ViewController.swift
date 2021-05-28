import UIKit

class ViewController: UIViewController {
    let fileSystem = FileManager.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("NSUserName: \(NSUserName())")
        print("NSFullUserName: \(NSFullUserName())")
        print("temporaryDirecty: \(fileSystem.temporaryDirectory)")
        print("NSTemporaryDirectory: \(NSTemporaryDirectory())")
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        print(path)
    }
}

