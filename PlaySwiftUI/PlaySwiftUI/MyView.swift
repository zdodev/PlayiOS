import SwiftUI
import Combine

struct MyView: View {
    @State private var isToggleOn = true
    
    var body: some View {
        VStack {
            PlayerView(title: "title")
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
