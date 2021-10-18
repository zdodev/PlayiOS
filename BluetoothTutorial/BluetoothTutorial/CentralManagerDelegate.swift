import CoreBluetooth

class CentralManagerDelegate: NSObject, CBCentralManagerDelegate {
    let peripheralDelegate = PeripheralDelegate()
    var peripherals = [CBPeripheral]()
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("central is poweredOn.")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("disDiscover: \(peripheral)")
        peripherals.append(peripheral)
        
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
    
    func discoverServices() {
        peripherals[0].discoverServices(nil)
    }
    
    func discoverCharacteristics(_ service: CBService) {
        peripherals[0].discoverCharacteristics(nil, for: service)
    }
}
