import SwiftUI
import MapKit

struct CreatingAndCombiningViews: View {
    // Computed property, 하나의 View 만을 반환한다.
    var body: some View {
        // 뷰를 세로로 배열
        VStack {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
//            CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                // 뷰를 가로로 배열
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    
                    // 유동적인 뷰
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
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
