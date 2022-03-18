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
        
        guard let discoveredServices = peripheral.services else {
            print("nil")
            return
        }
        discoveredServices.forEach { cbService in
            print(cbService)
            self.cbService = cbService
        }
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
        
        guard let discoveredCharacteristics = service.characteristics else {
            print("nil")
            return
        }
        
        discoveredCharacteristics.forEach { cbCharacteristic in
            print(cbCharacteristic)
            peripheral.setNotifyValue(true, for: cbCharacteristic)
            self.cbCharacteristic = cbCharacteristic
        }
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

        guard let data = characteristic.value else {
            print("nil")
            return
        }
        
        let receivedData = String(data: data, encoding: .utf8)
        print(receivedData)
        
//        data.forEach { element in
//            print(element)
//        }
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
