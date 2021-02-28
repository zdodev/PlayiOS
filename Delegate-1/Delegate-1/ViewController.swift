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
    
    var logoDownloader: LogoDownloader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        loginView.alpha = 0.0
        
        let imageURL = "https://cdn.spacetelescope.org/archives/images/publicationjpg/heic1509a.jpg"
        logoDownloader = LogoDownloader(logoURL: imageURL)
        logoDownloader?.delegate = self
        logoDownloader?.downloadLogo()
        if logoDownloader?.delegate == nil {
            loginView.alpha = 1.0
        }
    }
}

extension ViewController: LogoDownloaderDelegate {
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

