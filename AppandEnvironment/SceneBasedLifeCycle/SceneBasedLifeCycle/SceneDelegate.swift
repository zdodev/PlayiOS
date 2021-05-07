import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    // scene 연결 전
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("call... scene(_:willConnectTo:options:)")
        printSceneCurrentState(scene)
    }
    
    // unattached -> inactive 시
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("call... sceneWillEnterForeground(_:)")
        printSceneCurrentState(scene)
    }
    
    // inactive -> active 이후
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("call... sceneDidBecomeActive(_:)")
        printSceneCurrentState(scene)
    }
    
    // active -> inactive 시
    func sceneWillResignActive(_ scene: UIScene) {
        print("call... sceneWillResignActive(_:)")
        printSceneCurrentState(scene)
    }
    
    // inactive -> background 이후
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("call... sceneDidEnterBackground(_:)")
        printSceneCurrentState(scene)
    }
    
    // scene 연결 해제 시
    func sceneDidDisconnect(_ scene: UIScene) {
        print("call... sceneDidDisconnect(_:)")
        printSceneCurrentState(scene)
    }
    
    func printSceneCurrentState(_ scene: UIScene) {
        switch scene.activationState {
        case .unattached:
            print("scene is unattached")
        case .foregroundActive:
            print("scene is foregroundActive")
        case .foregroundInactive:
            print("scene is foregroundInactive")
        case .background:
            print("scene is background.")
        @unknown default:
            fatalError()
        }
    }
}

