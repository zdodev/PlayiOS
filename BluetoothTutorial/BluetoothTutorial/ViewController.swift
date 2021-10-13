import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    let centralManager = CBCentralManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let centralManagerDelegate = CentralManagerDelegate()
        centralManager.delegate = centralManagerDelegate
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
}

