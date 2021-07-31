import SwiftUI

struct MyTapView: View {
    var body: some View {
        TabView {
            Text("1번")
                .fontWeight(.black)
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            Text("2번")
                .fontWeight(.black)
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            Text("3번")
                .fontWeight(.black)
                .font(.largeTitle)
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
    }
}

struct MyTapView_Previews: PreviewProvider {
    static var previews: some View {
        MyTapView()
    }
}
