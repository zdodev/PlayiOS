import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            MyList()
                .navigationBarItems(leading: Button(action: {
                    print("하하")
                }) {
                    Text("하하")
                },
                trailing: NavigationLink(
                    destination: Text("넘어온 화면입니다.")) {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
                )
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
