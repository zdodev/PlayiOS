import SwiftUI

// View 프로토콜을 채택
struct ContentView: View {
    var body: some View {
        VStack {
            MyVStack()
            MyVStack()
            MyVStack()
        }
        .padding(.horizontal, 30)
        .background(Color.yellow)
    }
}

// PreviewProvider 프로토콜을 채택
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
