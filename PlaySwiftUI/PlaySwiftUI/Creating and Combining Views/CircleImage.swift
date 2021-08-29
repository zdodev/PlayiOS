import SwiftUI
    
struct CircleImage: View {
    var body: some View {
        // Views and Controls
        Image("turtlerock")
            .clipShape(Circle())
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
