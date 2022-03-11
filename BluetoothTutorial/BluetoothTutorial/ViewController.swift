import UIKit
import CoreBluetooth

final class ViewController: UIViewController {
    // Central 매니저 객체
    private let centralManager = CBCentralManager(delegate: nil, queue: .global())
    private let centralManagerDelegate = CentralManagerDelegate()
    
    // Peripheral 매니저 객체
    private let peripheralManager = CBPeripheralManager()
    private let peripheralManagerDelegate = PeripheralManagerDelegate()
    
//    private let serviceUUID = CBUUID(string: "AAAA4F43-5605-4C64-928C-D7F09530E558")
//    private let characteristicUUID = CBUUID(string: "BBBB4F43-5605-4C64-928C-D7F09530E558")
    
    private var mutableCharacteristic: CBMutableCharacteristic!
    private var mutableService: CBMutableService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager.delegate = centralManagerDelegate
        peripheralManager.delegate = peripheralManagerDelegate
        
        mutableCharacteristic = CBMutableCharacteristic(
            type: Identifier.characteristicUUID,
            properties: CBCharacteristicProperties.writeWithoutResponse,
            value: nil,
            permissions: CBAttributePermissions.readable)
        mutableService = CBMutableService(
            type: Identifier.serviceUUID,
            primary: true)
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
            withServices: [Identifier.serviceUUID],
            options: [CBCentralManagerScanOptionAllowDuplicatesKey: true]
        )
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

extension ViewController {
    @IBAction func tappedButton1(_ sender: UIButton) {
        peripheralManager.add(mutableService)
    }
    
    @IBAction func tappedButton2(_ sender: UIButton) {
        peripheralManager.startAdvertising([
            CBAdvertisementDataLocalNameKey: Identifier.peripheralAdvertisingName,
            CBAdvertisementDataServiceUUIDsKey: [Identifier.serviceUUID]
        ])
    }
    
    @IBAction func tappedStopAdvertising(_ sender: UIButton) {
        peripheralManager.stopAdvertising()
    }
}
