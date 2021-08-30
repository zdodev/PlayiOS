import SwiftUI

struct MyText: View {
    var body: some View {
        VStack {
            Text("Default")
            Text("Hamlet")
                .font(.title)
            Text("by William Shakespeare")
                .font(.system(size: 12, weight: .light, design: .serif))
                .italic()
            Text("To be, or not to be, that is the question:")
                .frame(width: 100)
            Text("Brevity is the soul or wit.")
                .frame(width: 100)
                .lineLimit(1)
        }
    }
}

struct MyText_Previews: PreviewProvider {
    static var previews: some View {
        MyText()
    }
}
