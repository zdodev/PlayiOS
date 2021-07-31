import Foundation
import SwiftUI
    
struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .padding()
            .background(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}
