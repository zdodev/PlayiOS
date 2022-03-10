import CoreBluetooth

final class PeripheralDelegate: NSObject, CBPeripheralDelegate {
    var cbService: CBService?
    var cbCharacteristic: CBCharacteristic?
    
    // MARK: - Discovering Services
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("didDiscoverServices")
        if let error = error {
            print(error)
            return
        }
        
        print(peripheral)
//        guard let discoveredServices = peripheral.services else {
//            print("nil")
//            return
//        }
//
//        print(discoveredServices)
//        cbService = discoveredServices[0]
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverIncludedServicesFor service: CBService, error: Error?) {
        print("didDiscoverIncludedServicesFor")
        if let error = error {
            print(error)
            return
        }
        
        print(service)
    }
    
    // MARK: - Discovering Characteristics and their Descriptors
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("didDiscoverCharacteristicsFor")
        if let error = error {
            print(error)
            return
        }
        print(service)
//        guard let discoveredCharacteristics = service.characteristics else {
//            print("nil")
//            return
//        }
        
//        print(discoveredCharacteristics)
//        cbCharacteristic = discoveredCharacteristics[0]
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {
        print("didDiscoverDescriptorsFor")
        if let error = error {
            print(error)
            return
        }
        
        print(characteristic)
    }
    
    // MARK: - Retrieving Characteristic and Descriptor Values
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        print("didUpdateValueFor")
        if let error = error {
            print(error)
        }
        print(characteristic)
//        guard let value = characteristic.value else {
//            print("nil")
//            return
//        }
//
//        let data = value.withUnsafeBytes {
//            $0.map { $0 }
//        }
//        print(data)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        print("didUpdateValueFor")
        if let error = error {
            print(error)
            return
        }
        
        print(descriptor)
    }
    
    // MARK: - Writing Characteristic and Descriptor Values
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        print("didWriteValueFor")
        if let error = error {
            print(error)
            return
        }
        
        print(characteristic)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor descriptor: CBDescriptor, error: Error?) {
        print("didWriteValueFor")
        if let error = error {
            print(error)
            return
        }
        
        print(descriptor)
    }
    
    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        print("toSendWriteWithoutResponse")
        print(peripheral)
    }
    
    // MARK: - Managing Notifications for a Characteristic's Value
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        print("didUpdateNotificationStateFor")
        if let error = error {
            print(error)
            return
        }
        
        print(characteristic)
    }
    
    // MARK: - Retrieving a Peripheral's RSSI Data
    
    func peripheral(_ peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: Error?) {
        print("didReadRSSI")
        if let error = error {
            print(error)
            return
        }
        
        print(RSSI)
    }
    
    // MARK: - Monitoring Changes to a Peripheral's Name or Services
    
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        print("peripheralDidUpdateName")
        print(peripheral)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        print("didModifyServices")
        print(invalidatedServices)
    }
    
    // MARK: - Monitoring L2CAP Channels
    
    func peripheral(_ peripheral: CBPeripheral, didOpen channel: CBL2CAPChannel?, error: Error?) {
        print("didOpen")
        if let error = error {
            print(error)
            return
        }
        if let channel = channel {
            print(channel)
        }
    }
}
