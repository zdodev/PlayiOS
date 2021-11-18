import SwiftUI

// HomeScreen()

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)

                    VStack(alignment: .leading) {
                        Text("Luruxy Swedia \nChair")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 4) {
                            ForEach(0 ..< 5) { item in
                                Image("star")
                            }
                            Text("(4.9)")
                                .opacity(0.5)
                                .padding(.leading, 8)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color("Bg"))
                    .cornerRadius(40.0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
