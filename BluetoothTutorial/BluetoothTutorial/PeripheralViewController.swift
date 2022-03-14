import UIKit
import CoreBluetooth

final class PeripheralViewController: UIViewController {
    // Peripheral 매니저
    private var peripheralManager: CBPeripheralManager
    private let peripheralManagerDelegate = PeripheralManagerDelegate()
    
    private var mutableCharacteristic: CBMutableCharacteristic
    private var mutableService: CBMutableService
    
    required init?(coder: NSCoder) {
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

extension PeripheralViewController {
    @IBAction func tappedAddServiceButton(_ sender: UIButton) {
        peripheralManager.add(mutableService)
    }
    
    @IBAction func tappedStartAdvertisingButton(_ sender: UIButton) {
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
