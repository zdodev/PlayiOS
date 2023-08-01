import UIKit
import ComposableArchitecture

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        
        let rootViewController = MainViewController(store: Store(initialState: MainDomain.State()) {
            MainDomain()
        })
        let nav = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}
