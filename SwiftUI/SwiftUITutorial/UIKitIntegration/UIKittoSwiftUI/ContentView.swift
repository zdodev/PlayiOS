import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            // UIViewController -> SwiftUI View
            NameUIViewController().toView
            
            // UIView -> SwiftUI View
            NameUIView().toView
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
