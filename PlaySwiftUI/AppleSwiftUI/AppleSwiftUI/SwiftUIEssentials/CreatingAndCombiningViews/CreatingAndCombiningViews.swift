import SwiftUI

struct CreatingAndCombiningViews: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Hello SwiftUI!")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree national Park")
                    
                    Spacer()
                    
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About TurtleRock")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CreatingAndCombiningViews_Previews: PreviewProvider {
    static var previews: some View {
        CreatingAndCombiningViews()
    }
}
