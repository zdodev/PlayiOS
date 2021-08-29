import SwiftUI

struct MyVStack: View {
    var body: some View {
        // View Layout and Presentation
        VStack(alignment: .leading, spacing: 10, content: {
            ForEach(1...10, id: \.self) { index in
                Text("Item \(index)")
            }
        })
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
