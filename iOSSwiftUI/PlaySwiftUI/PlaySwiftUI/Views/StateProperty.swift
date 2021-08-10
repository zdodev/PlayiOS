import SwiftUI

struct StateProperty: View {
    @State private var wifiEnabled = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Label")
            }
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
    }
}

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

struct StateProperty_Previews: PreviewProvider {
    static var previews: some View {
        StateProperty()
    }
}
