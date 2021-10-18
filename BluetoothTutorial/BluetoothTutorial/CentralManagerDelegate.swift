import CoreBluetooth

class CentralManagerDelegate: NSObject, CBCentralManagerDelegate {
    let peripheralDelegate = PeripheralDelegate()
    var cbPeripheral: CBPeripheral?
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("central is poweredOn.")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("disDiscover: \(peripheral)")
        cbPeripheral = peripheral
        
        peripheral.delegate = peripheralDelegate
        
        central.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("didConnect")
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("didFailToConnect")
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("didDisconnectPeripheral")
    }
    
    func centralManager(_ central: CBCentralManager, connectionEventDidOccur event: CBConnectionEvent, for peripheral: CBPeripheral) {
        print("connectionEventDidOccur")
    }
    
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
