import AVFoundation

final class QRCodeReaderViewModel: NSObject {
    let country = Binder(Country(name: "", code: "", date: Date()))
}

extension QRCodeReaderViewModel: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject, let stringValue = readableObject.stringValue else {
                return
            }
            
            guard let data = stringValue.data(using: .utf8) else {
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(Country.self, from: data) else {
                return
            }
            
            country.value = decodedData
        }
    }
}

