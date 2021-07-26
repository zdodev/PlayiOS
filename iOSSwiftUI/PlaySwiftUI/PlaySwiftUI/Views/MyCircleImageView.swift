import SwiftUI

struct MyCircleImageView: View {
    var body: some View {
        Image("bird")
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
            .padding(.trailing, 10)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .overlay(
                Circle()
                    .strokeBorder(Color.yellow, lineWidth: 15)
            )
    }
}

struct MyCircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyCircleImageView()
    }
}
