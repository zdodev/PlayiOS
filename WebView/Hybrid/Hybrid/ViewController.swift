import UIKit
import WebKit

final class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        // WKScriptMessageHandler 연결
        webView.configuration.userContentController.add(self, name: "back")
        webView.configuration.userContentController.add(self, name: "outLink")
        
        if let url = Bundle.main.url(forResource: "Example", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        webView.evaluateJavaScript("complete()") { result, error in
            if let result = result {
                print(result)
            }
        }
    }
}

extension ViewController: WKUIDelegate {
    // JavaScript alert 호출 시
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler()
        }
        alertController.addAction(okAlertAction)
        present(alertController, animated: true)
    }
    
    // JavaScript confirm 호출 시
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler(true)
        }
        let cancelAlertAction = UIAlertAction(title: "취소", style: .default) { _ in
            completionHandler(false)
        }
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAlertAction)
        present(alertController, animated: true)
    }
    
    // JavaScript prompt 호출 시
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alertController = UIAlertController(title: "", message: prompt, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                completionHandler(text)
            } else {
                completionHandler(defaultText)
            }
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        switch message.name {
        case "back":
            let alertController = UIAlertController(title: nil, message: "Back 버튼 클릭", preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true)
        case "outLink":
            guard let outLink = message.body as? String, let url = URL(string: outLink) else {
                return
            }
            
            let alertController = UIAlertController(title: "OutLink 버튼 클릭", message: "URL : \(outLink)", preferredStyle: .alert)
            let openAlertAction = UIAlertAction(title: "링크 열기", style: .default) { _ in
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            let cancelAlertAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alertController.addAction(openAlertAction)
            alertController.addAction(cancelAlertAction)
            present(alertController, animated: true)
        default:
            break
        }
    }
}
