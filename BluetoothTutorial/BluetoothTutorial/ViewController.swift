import UIKit
import CoreBluetooth

final class ViewController: UIViewController {
    // Central 매니저
    private let centralManager: CBCentralManager
    private let centralManagerDelegate = CentralManagerDelegate()
    
    // Peripheral 매니저
    private var peripheralManager: CBPeripheralManager
    private let peripheralManagerDelegate = PeripheralManagerDelegate()
    
    private var mutableCharacteristic: CBMutableCharacteristic
    private var mutableService: CBMutableService
    
    required init?(coder: NSCoder) {
        centralManager = CBCentralManager(delegate: nil, queue: .global())
        centralManager.delegate = centralManagerDelegate
        
        peripheralManager = CBPeripheralManager(delegate: nil, queue: .global())
        peripheralManager.delegate = peripheralManagerDelegate
        
        mutableCharacteristic = CBMutableCharacteristic(
            type: Identifier.characteristicUUID,
            properties: [.notify, .read, .writeWithoutResponse],
            value: nil,
            permissions: [.readable, .writeable]
        )
        mutableService = CBMutableService(
            type: Identifier.serviceUUID,
            primary: true
        )
        mutableService.characteristics = [mutableCharacteristic]
        
        super.init(coder: coder)
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
    
    @IBAction func tappedWriteValueButton(_ sender: UIButton) {
        let result = peripheralManager.updateValue(
            Data([1, 2, 3]),
            for: mutableCharacteristic,
            onSubscribedCentrals: nil
        )
        print(result)
    }
}
