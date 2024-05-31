import SwiftUI
import WebKit

struct SUWebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> some UIView {
        print(#function)
        let webView = WKWebView(frame: .zero)
        webView.navigationDelegate = context.coordinator
        
        if let url = URL(string: url) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print(#function)
    }
    
    func makeCoordinator() -> Coordinator {
        print(#function)
        return Coordinator(self)
    }
    
    final class Coordinator: NSObject, WKNavigationDelegate {
        let webView: SUWebView
        
        init(_ webView: SUWebView) {
            self.webView = webView
        }
        
        // MARK: - Allowing or denying navigation requests
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {

            print(#function, "navigationAction")
            return .allow
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse) async -> WKNavigationResponsePolicy {
            print(#function, "navigationResponse")
            return .allow
        }
        
        // MARK: - Tracking the laod progress of a request
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print(#function)
        }
        
        func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
            print(#function)
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            print(#function)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print(#function)
        }
        
        // MARK: - Responding to navigation errors
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
            print(#function)
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: any Error) {
            print(#function)
        }
    }
}
