import SwiftUI

struct ContentView: View {
    private let locationService = LocationService()
    
    var body: some View {
        VStack {
            Text("현재 위치: \(locationService.address)")
            
            Button {
                locationService.requestAuthorization()
            } label: {
                Text("권한 요청")
            }
            .padding()
            
            Button {
                locationService.detectLocation()
            } label: {
                Text("권한 요청")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
