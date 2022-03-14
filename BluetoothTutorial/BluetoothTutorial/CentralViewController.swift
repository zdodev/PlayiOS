import UIKit
import CoreBluetooth

final class CentralViewController: UIViewController {
    // Central 매니저
    private let centralManager: CBCentralManager
    private let centralManagerDelegate = CentralManagerDelegate()
    
    required init?(coder: NSCoder) {
        centralManager = CBCentralManager(delegate: nil, queue: .global())
        centralManager.delegate = centralManagerDelegate
        
        super.init(coder: coder)
    }
}

extension CentralViewController {
    @IBAction func tappedScanForPeripheralsButton(_ sender: UIButton) {
        print("start scanForPeripherals")
        centralManager.scanForPeripherals(
            withServices: [Identifier.serviceUUID],
            options: [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        )
    }
    
    @IBAction func tappedStopScanButton(_ sender: UIButton) {
        print("stop scanForPeripherals")
        centralManager.stopScan()
    }
    
    @IBAction func tappedDiscoverServices(_ sender: UIButton) {
        centralManagerDelegate.discoverServices(Identifier.serviceUUID)
    }
    
    @IBAction func tappedDiscoverCharacteristics(_ sender: UIButton) {
        centralManagerDelegate.discoverCharacteristics()
    }
    
    @IBAction func tappedReadValue(_ sender: UIButton) {
        centralManagerDelegate.readValue()
    }
    
    @IBAction func tappedWriteValue(_ sender: UIButton) {
        centralManagerDelegate.writeValue()
    }
}
