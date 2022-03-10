import CoreBluetooth

struct PeripheralService {
    private let peripheralManager: CBPeripheralManager
    private let peripheralManagerDelegate = PeripheralManagerDelegate()
    
    init() {
        peripheralManager = CBPeripheralManager(delegate: peripheralManagerDelegate, queue: .global())
    }
}

final class PeripheralManagerDelegate: NSObject, CBPeripheralManagerDelegate {
    // MARK: - Monitoring Changes to the Peripheral Manager's State
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .unknown:
            print("peripheral unknown state")
        case .resetting:
            print("peripheral resetting state")
        case .unsupported:
            print("peripheral unsupported state")
        case .unauthorized:
            print("peripheral unauthorized state")
        case .poweredOff:
            print("peripheral poweredOff state")
        case .poweredOn:
            print("peripheral poweredOn state")
        @unknown default:
            print("peripheral unknown state")
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, willRestoreState dict: [String : Any]) {
        print("willRestoreState")
    }
    
    // MARK: - Adding Services
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error {
            print("peripheral didAdd service fail.")
            print(error)
            return
        }
        
        print("didAdd:")
        debugPrint(service)
    }
    
    // MARK: - Advertising Peripheral Data
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("peripheral startAdvertising fail.")
            print(error)
            return
        }
        
        print("didStartAdvertising")
    }
    
    // MARK: - Monitoring Subscriptions to Characteristic Values
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("didSubscribeTo")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        print("didUnsubscribeFrom")
    }
    
    func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
        print("toUpdateSubscribers")
    }
    
    // MARK: - Receiving Read and Write Requests
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        print("didReceiveRead")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        print("didReceiveWrite")
    }
    
    // MARK: - Using L2CAP Channels
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didPublishL2CAPChannel PSM: CBL2CAPPSM, error: Error?) {
        print("didPublishL2CAPChannel")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didUnpublishL2CAPChannel PSM: CBL2CAPPSM, error: Error?) {
        print("didUnpublishL2CAPChannel")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didOpen channel: CBL2CAPChannel?, error: Error?) {
        print("didOpen")
    }
}
