import UIKit

// 로고 다운로더
class LogoDownloader {
    var logoURL: String
    var image: UIImage?
    // 델리게이트 변수 선언
    // LogoDownloaderDelegate protocol을 준수하는 타입 할당 가능
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
    
    // 델리게이트 트리거 메서드
    func didDownloadImage() {
        // 델리게이트의 didFinishDownloading(_:) 메서드 호출
        // 델리게이트에서 구현한 코드가 실행
        delegate?.didFinishDownloading(self)
    }
}

protocol LogoDownloaderDelegate {
    func didFinishDownloading(_ sender: LogoDownloader)
}
