import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    // MARK: - Connecting and disconnecting the scene

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("session = \(session)")
        print("connectionOptions = \(connectionOptions)")
        
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("💥 \(#function)")
        print("scene = \(scene)")
    }
    
    // MARK: - Transitioning to the foreground
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("💥 \(#function)")
        print("scene = \(scene)")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("💥 \(#function)")
        print("scene = \(scene)")
    }
    
    // MARK: - Transitioning to the background
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("💥 \(#function)")
        print("scene = \(scene)")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("💥 \(#function)")
        print("scene = \(scene)")
    }
    
    // MARK: - Opening URLs
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("URLContexts = \(URLContexts)")
    }
    
    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("userActivityType = \(userActivityType)")
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("userActivity = \(userActivity)")
    }
    
    func scene(_ scene: UIScene, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("userActivity = \(userActivityType)")
        print("error = \(error)")
    }
    
    // MARK: - Saving the state of the scene
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        print("💥 \(#function)")
        print("scene = \(scene)")
        return nil
    }
    
    func scene(_ scene: UIScene, restoreInteractionStateWith stateRestorationActivity: NSUserActivity) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("stateRestorationActivity = \(stateRestorationActivity)")
    }
    
    func scene(_ scene: UIScene, didUpdate userActivity: NSUserActivity) {
        print("💥 \(#function)")
        print("scene = \(scene)")
        print("userActivity = \(userActivity)")
    }
    
    // MARK: - Responding to scene changes
    
    func windowScene(_ windowScene: UIWindowScene, didUpdate previousCoordinateSpace: UICoordinateSpace, interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation, traitCollection previousTraitCollection: UITraitCollection) {
        print("💥 \(#function)")
        print("windowScene = \(windowScene)")
        print("previousCoordinateSpace = \(previousCoordinateSpace)")
        print("previousInterfaceOrientation = \(previousInterfaceOrientation)")
        print("previousTraitCollection = \(previousTraitCollection)")
    }
    
    // MARK: - Performing tasks
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem) async -> Bool {
        print("💥 \(#function)")
        print("windowScene = \(windowScene)")
        print("shortcutItem = \(shortcutItem)")
        return true
    }
    
//    func windowScene(_ windowScene: UIWindowScene, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShare.Metadata)
}
