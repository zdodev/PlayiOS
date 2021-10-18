import CoreBluetooth

class PeripheralManagerDelegate: NSObject, CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            print("peripheral is poweredOn.")
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error {
            print("peripheral didAdd service fail.")
            print(error)
        }
        
        print("didAdd \(service)")
    }
    
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("peripheral startAdvertising fail.")
            print(error)
            return
        }
        
        print("didStartAdvertising")
    }
}
