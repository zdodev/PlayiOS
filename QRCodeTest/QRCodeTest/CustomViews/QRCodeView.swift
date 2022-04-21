import UIKit

final class QRCodeView: UIImageView {
    private let filter = CIFilter(name: "CIQRCodeGenerator")
    
    func generateCode(_ data: Data) {
        guard let filter = filter else {
            return
        }
        
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("M", forKey: "inputCorrectionLevel")
        
        guard let ciImage = filter.outputImage else {
            return
        }
        
        let transformed = ciImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10))
        
        let invertFilter = CIFilter(name: "CIColorInvert")
        invertFilter?.setValue(transformed, forKey: kCIInputImageKey)
        
        let alphaFilter = CIFilter(name: "CIMaskToAlpha")
        alphaFilter?.setValue(invertFilter?.outputImage, forKey: kCIInputImageKey)
        
        if let ouputImage = alphaFilter?.outputImage {
            image = UIImage(ciImage: ouputImage, scale: 2.0, orientation: .up).withRenderingMode(.alwaysTemplate)
        }
    }
}
