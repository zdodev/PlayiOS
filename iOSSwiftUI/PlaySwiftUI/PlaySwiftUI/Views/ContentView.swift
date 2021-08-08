import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Group {
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
            }
            
            Group {
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
                Text("Sample Text")
            }
            .background(Color.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
