import SwiftUI
import WebKit

// UIKit
struct MyWebView: UIViewRepresentable {
    var urlToLoad = "https://www.google.com"
    
    // UIView 작성하기
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: URL(string: urlToLoad)!))
        return webView
    }
    
    // update UIView
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
//        MyWebView(urlToLoad: "https://www.naver.com")
        MyWebView()
    }
}
