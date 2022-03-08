import CoreBluetooth

final class CentralManagerDelegate: NSObject, CBCentralManagerDelegate {
    let peripheralDelegate = PeripheralDelegate()
    var cbPeripheral: CBPeripheral?
    
    // MARK: - Monitoring Connections with Peripherals
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("didConnect")
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("didDisconnectPeripheral")
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("didFailToConnect")
    }
    
    func centralManager(_ central: CBCentralManager, connectionEventDidOccur event: CBConnectionEvent, for peripheral: CBPeripheral) {
        print("connectionEventDidOccur")
    }
    
    // MARK: - Discovering and Retrieving Peripherals
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("disDiscover:")
        debugPrint(peripheral)
        
//        cbPeripheral = peripheral
//
//        peripheral.delegate = peripheralDelegate
//
//        central.connect(peripheral, options: nil)
    }
    
    // MARK: - Monitoring the Central Manager's State
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central unknown state")
        case .resetting:
            print("central resetting state")
        case .unsupported:
            print("central unsupported state")
        case .unauthorized:
            print("central unauthorized state")
        case .poweredOff:
            print("central poweredOff state")
        case .poweredOn:
            print("central poweredOn state")
        @unknown default:
            print("central unknown state")
        }
    }
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        debugPrint("willRestoreState")
    }
    
    func centralManager(_ central: CBCentralManager, didUpdateANCSAuthorizationFor peripheral: CBPeripheral) {
        debugPrint("didUpdateANCSAuthorizationFor")
    }

    ///
    
    func discoverServices(_ cbUUID: CBUUID) {
        cbPeripheral?.discoverServices([cbUUID])
    }
    
    func discoverCharacteristics() {
        if let service = peripheralDelegate.cbService {
            cbPeripheral?.discoverCharacteristics(nil, for: service)
        }
    }
    
    func readValue() {
        if let characteristic = peripheralDelegate.cbCharacteristic {
            cbPeripheral?.readValue(for: characteristic)
        }
    }
}
