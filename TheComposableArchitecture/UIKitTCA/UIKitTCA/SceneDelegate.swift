import UIKit
import ComposableArchitecture

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        
        let state = Store(
            initialState: Counter.State(),
            reducer: Counter()
        )
        let viewStore = ViewStore(state) { $0 }
        let rootViewController = CounterViewController(viewStore: viewStore)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
