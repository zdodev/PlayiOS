import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 50) {
//            Rectangle()
//                .frame(height: 0)
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            Spacer()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
        }
        .frame(width: 300)
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
