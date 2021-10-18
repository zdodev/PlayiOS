import CoreBluetooth

class PeripheralDelegate: NSObject, CBPeripheralDelegate {
    var cbService: CBService?
    var cbCharacteristic: CBCharacteristic?
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("didDiscoverServices")
        if let error = error {
            print(error)
        }
        guard let discoveredServices = peripheral.services else {
            print("nil")
            return
        }
        
        print(discoveredServices)
        cbService = discoveredServices[0]
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("didDiscoverCharacteristicsFor")
        if let error = error {
            print(error)
        }
        guard let discoveredCharacteristics = service.characteristics else {
            print("nil")
            return
        }
        
        print(discoveredCharacteristics)
        cbCharacteristic = discoveredCharacteristics[0]
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        print("didUpdateValueFor")
        if let error = error {
            print(error)
        }
        guard let value = characteristic.value else {
            print("nil")
            return
        }
        
        let data = value.withUnsafeBytes {
            $0.map { $0 }
        }
        print(data)
    }
}
