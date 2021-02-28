//
//  ViewController.swift
//  Delegate-1
//
//  Created by Zero DotOne on 2021/02/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // 로고 다운로더 변수 선언
    var logoDownloader: LogoDownloader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        loginView.alpha = 0.0
        
        let imageURL = "https://cdn.spacetelescope.org/archives/images/publicationjpg/heic1509a.jpg"
        // 로고 다운로더 할당
        logoDownloader = LogoDownloader(logoURL: imageURL)
        // 로고 다운로더의 델리게이트 설정(self)
        // 로고 다운로더의 델리게이트 설정 시 에러가 나는 이유
        // Cannot assign value of type 'ViewController' to type 'LogoDownloaderDelegate?'
        // Add missing conformance to 'LogoDownloaderDelegate' to class 'ViewController'
        logoDownloader?.delegate = self
        // 로고 다운로더의 로고 다운로드 메서드 실행
        logoDownloader?.downloadLogo()
        if logoDownloader?.delegate == nil {
            loginView.alpha = 1.0
        }
    }
}

// LogoDownloaderDelegate protocol 채택
extension ViewController: LogoDownloaderDelegate {
    // LogoDownloaderDelegate 요구 메서드 구현
    // delegate(LogoDownloader)에서 사용될 코드 구현
    func didFinishDownloading(_ sender: LogoDownloader) {
        imageView.image = logoDownloader?.image
        UIView.animate(withDuration: 2.0, delay: 0.5, options: UIView.AnimationOptions.curveEaseIn, animations:  {
            self.loadingLabel.alpha = 0.0
            self.imageView.alpha = 1.0
        }) { (completed:Bool) in
            if (completed) {
                UIView.animate(withDuration: 2.0) {
                    self.loginView.alpha = 1.0
                }
            }
        }
    }
}
