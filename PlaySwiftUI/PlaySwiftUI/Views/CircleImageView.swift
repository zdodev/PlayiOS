import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 2, y: 10)
        Image("myImage")
            .resizable()
            .scaledToFill()
//            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(Circle().foregroundColor(.black)
                        .opacity(0.9))
            .overlay(Circle().stroke(Color.red, lineWidth: 10))
            .overlay(Text("호호")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(.bold))
//            .clipped()
//            .edgesIgnoringSafeArea(.all)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
