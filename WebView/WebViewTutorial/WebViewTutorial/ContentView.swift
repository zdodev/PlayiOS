import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SUWebView(url: "https://www.naver.com")
        }
    }
}

#Preview {
    ContentView()
}
