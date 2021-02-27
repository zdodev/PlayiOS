import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        window?.rootViewController = ViewController()
    }
    
    // MARK: Scene Lifecycle
    // The scene is about to begin running in the fourground and become visible to the user.
    // State transition: unattached -> foreground inactive
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Update your app's data model when entering the foreground.
        print("call... sceneWillEnterForeground(_:)")
    }
    
    // The scene became active and is now responding to user events.
    // State transition: foreground inactive -> foreground active
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Configure your user interface and initial tasks at activation.
        print("call... sceneDidBecomeActive(_:)")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

