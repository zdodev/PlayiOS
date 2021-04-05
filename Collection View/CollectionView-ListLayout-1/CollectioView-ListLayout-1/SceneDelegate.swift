import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return 
        }
        let window = UIWindow(windowScene: windowScene)
        
        let vc = ViewController()
        vc.title = "Users"
        
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }
}

