import UIKit

final class ViewController: UIViewController {
    private let device = UIDevice.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("name = \(device.name)")
        print("systemName = \(device.systemName)")
        print("systemVersion = \(device.systemVersion)")
        print("model = \(device.model)")
        print("localizedModel = \(device.localizedModel)")
        print("userInterfaceIdiom = \(device.userInterfaceIdiom)")
        if let identifierForVendor = device.identifierForVendor {
            print("identifierForVendor = \(identifierForVendor)")
        } else {
            print("identifierForVendor = nil")
        }
        print("isMultitaskingSupported = \(device.isMultitaskingSupported)")
    }
}
