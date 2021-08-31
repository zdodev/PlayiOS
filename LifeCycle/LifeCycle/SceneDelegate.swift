import UIKit
import CloudKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Managing the Scene's Main Window
    
    var window: UIWindow?
    
    // MARK: - Responding to Scene Changes
    
    func windowScene(_ windowScene: UIWindowScene, didUpdate previousCoordinateSpace: UICoordinateSpace, interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation, traitCollection previousTraitCollection: UITraitCollection) {
        print("SceneDelegate::windowScene(_:didUpdate:interfaceOrientation:traitCollection:)")
    }
    
    // MARK: - Performing Tasks
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        print("SceneDelegate::windowScene(_:performActionFor:completionHandler:")
    }
    
    func windowScene(_ windowScene: UIWindowScene, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShare.Metadata) {
        print("SceneDelegate::windowScene(_:userDidAcceptCloudKitShareWith:")
    }
    
    // MARK: - Connecting and Disconnecting the Scene

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        // guard let _ = (scene as? UIWindowScene) else { return }
        print("SceneDelegate::scene(_:willConnectTo:options:)")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("SceneDelegate::sceneDidDisconnect(_:)")
    }
    
    // MARK: - Transitioning to the Foreground
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("SceneDelegate::sceneWillEnterForeground(_:)")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("SceneDelegate::sceneDidBecomeActive(_:)")
    }
    
    // MARK: - Transitioning to the Background

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("SceneDelegate::sceneWillResignActive(_:)")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("SceneDelegate::sceneDidEnterBackground(_:)")
    }
    
    // MARK: - Opening URLs
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("SceneDelegate::scene(_:openURLContexts:)")
    }
    
    // MARK: - Continuing User Activities
    
    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        print("SceneDelegate::scene(_:willContinueUserActivityWithType:)")
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        print("SceneDelegate::scene(_:continue:)")
    }
    
    func scene(_ scene: UIScene, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        print("SceneDelegate::scene(_:didFailToContinueUserActivityWithType:error:)")
    }
    
    // MARK: - Saving the State of the Scene
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        print("SceneDelegate::stateRestorationActivity(for:)")
        
        return scene.userActivity
    }
    
    func scene(_ scene: UIScene, didUpdate userActivity: NSUserActivity) {
        print("SceneDelegate::scene(_:didUpdate:)")
    }
}

