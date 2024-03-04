import SwiftUI

@main
struct UIKitIntegrationApp: App {
    var body: some Scene {
        WindowGroup {
            // ContentView()
            MainViewController().toView
        }
    }
}
