import CoreBluetooth

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
        print("didAdd")
        if let error = error {
            print(error)
            return
        }
        
        print(service)
    }
    
    // MARK: - Advertising Peripheral Data
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
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
        request.value = Data("test".data(using: .utf8)!)
        peripheral.respond(to: request, withResult: .success)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        print("didReceiveWrite")
        guard let request = requests.first else {
            return
        }
        guard let value = request.value else {
            return
        }
        
        let receivedData = String(data: value, encoding: .utf8)!
        print(receivedData)
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
