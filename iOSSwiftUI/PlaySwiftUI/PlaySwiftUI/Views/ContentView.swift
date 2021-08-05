import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Financial Results")
                .font(.title)
            HStack {
                Text("Q1 Sales")
                    .font(.headline)
                VStack {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                VStack {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
