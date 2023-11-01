import UIKit
import BackgroundTasks

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let appBackgroundTaskService = AppBackgroundTaskService()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        appBackgroundTaskService.startBackgroundTask()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        appBackgroundTaskService.scheduleBackgroundTask()
    }
}
