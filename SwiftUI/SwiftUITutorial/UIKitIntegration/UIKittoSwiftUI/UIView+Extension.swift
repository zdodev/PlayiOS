import UIKit
import SwiftUI

extension UIView {
    // UIView -> SwiftUI View
    struct SwiftUIPresent: UIViewRepresentable {
        private let view: UIView
        
        init(view: UIView) {
            self.view = view
        }
        
        func makeUIView(context: Context) -> some UIView {
            view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
    
    var toView: some View {
        SwiftUIPresent(view: self)
    }
}
