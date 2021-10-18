import CoreBluetooth

class PeripheralDelegate: NSObject, CBPeripheralDelegate {
    var services = [CBService]()
    
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
        services = discoveredServices
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
    }
}
