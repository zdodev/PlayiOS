import Foundation
import CoreBluetooth

struct Identifier {
    static let serviceUUID = CBUUID(string: "AAAA4F43-5605-4C64-928C-D7F09530E558")
    static let characteristicUUID = CBUUID(string: "BBBB4F43-5605-4C64-928C-D7F09530E558")
    static let peripheralAdvertisingName = "test"
}
