import UIKit
import CoreBluetooth

final class ViewController: UIViewController {
    // Central 매니저 객체
    private let centralManager = CBCentralManager()
    private let centralManagerDelegate = CentralManagerDelegate()
    
    // Peripheral 매니저 객체
    private let peripheralManager = CBPeripheralManager()
    private let peripheralManagerDelegate = PeripheralManagerDelegate()
    
    private let serviceUUID = CBUUID(string: "AAAA4F43-5605-4C64-928C-D7F09530E558")
    private let characteristicUUID = CBUUID(string: "BBBB4F43-5605-4C64-928C-D7F09530E558")
    
    private var mutableCharacteristic: CBMutableCharacteristic!
    private var mutableService: CBMutableService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager.delegate = centralManagerDelegate
        peripheralManager.delegate = peripheralManagerDelegate
        
        mutableCharacteristic = CBMutableCharacteristic(type: characteristicUUID, properties: CBCharacteristicProperties.read, value: Data([1, 2, 3]), permissions: CBAttributePermissions.readable)
        mutableService = CBMutableService(type: serviceUUID, primary: true)
        mutableService.characteristics = [mutableCharacteristic]
    }
}

extension ViewController {
    @IBAction func tappedScanAllPeripheralsButton(_ sender: UIButton) {
        centralManager.scanForPeripherals(
            withServices: nil,
            options: [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        )
    }
    
    @IBAction func tappedStopScanButton(_ sender: UIButton) {
        centralManager.stopScan()
    }
    
    @IBAction func tappedScanSGA(_ sender: UIButton) {
        centralManager.scanForPeripherals(
            withServices: [serviceUUID],
            options: [CBCentralManagerScanOptionAllowDuplicatesKey: true]
        )
    }
    
    @IBAction func tappedDiscoverServices(_ sender: UIButton) {
        centralManagerDelegate.discoverServices(serviceUUID)
    }
    
    @IBAction func tappedDiscoverCharacteristics(_ sender: UIButton) {
        centralManagerDelegate.discoverCharacteristics()
    }
    
    @IBAction func tappedReadValue(_ sender: UIButton) {
        centralManagerDelegate.readValue()
    }
}

extension ViewController {
    @IBAction func tappedButton1(_ sender: UIButton) {
        peripheralManager.add(mutableService)
    }
    
    @IBAction func tappedButton2(_ sender: UIButton) {
        peripheralManager.startAdvertising([CBAdvertisementDataLocalNameKey: serviceUUID.uuidString, CBAdvertisementDataServiceUUIDsKey: [serviceUUID]])
    }
    
    @IBAction func tappedStopAdvertising(_ sender: UIButton) {
        peripheralManager.stopAdvertising()
    }
}
