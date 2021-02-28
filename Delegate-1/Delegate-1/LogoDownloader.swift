import UIKit

class LogoDownloader {
    var logoURL: String
    var image: UIImage?
    var delegate: LogoDownloaderDelegate?
    
    init(logoURL: String) {
        self.logoURL = logoURL
    }
    
    func downloadLogo() {
        DispatchQueue.global().async {
            let imageURL = URL(string: self.logoURL)
            let imageData = try! Data(contentsOf: imageURL!)
            self.image = UIImage(data: imageData)
        }
        DispatchQueue.main.async {
            self.didDownloadImage()
        }
    }
    
    func didDownloadImage() {
        delegate?.didFinishDownloading(self)
    }
}

protocol LogoDownloaderDelegate {
    func didFinishDownloading(_ sender: LogoDownloader)
}
