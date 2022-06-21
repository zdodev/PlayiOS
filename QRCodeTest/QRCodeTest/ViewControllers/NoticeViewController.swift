//
//  NoticeViewController.swift
//  QRCodeTest
//
//  Created by admin on 2022/04/19.
//

import UIKit
import WebKit

final class NoticeViewController: UIViewController {
    @IBOutlet weak var noticeWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlRequest = createURLRequest() else {
            return
        }
        
        noticeWebView.load(urlRequest)
    }
    
    private func createURLRequest() -> URLRequest? {
        let urlString = "https://www.apple.com"
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        return URLRequest(url: url)
    }
}
