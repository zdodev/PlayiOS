import SwiftUI
import MapKit

// Use SwiftUI Views From Other Frameworks
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // State property wrapper
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // State property binding
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
