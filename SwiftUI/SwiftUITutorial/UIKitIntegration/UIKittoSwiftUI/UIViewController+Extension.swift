import UIKit
import SwiftUI

extension UIViewController {
    // UIViewController -> SwiftUI View
    private struct SwiftUIPresent: UIViewControllerRepresentable {
        private let viewController: UIViewController
        
        init(viewController: UIViewController) {
            self.viewController = viewController
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    }
    
    var toView: some View {
        SwiftUIPresent(viewController: self)
    }
}
