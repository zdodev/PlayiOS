import SwiftUI

struct MyVStack: View {
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 80))
            Text("2!")
                .fontWeight(.bold)
                .font(.system(size: 80))
            Text("3!")
                .fontWeight(.bold)
                .font(.system(size: 80))
        }
        .background(Color.green)
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
