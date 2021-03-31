import UIKit

// Scene에서 발생하는 앱별 작업을 관리합니다.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // 앱 사용자 인터페이스의 배경과 이벤트를 뷰로 전달하는 객체
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 앱에 대한 하나 이상의 윈도우를 관리하는 특정 유형의 scene
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        // 하드웨어 기반의 디스플레이와 관련된 속성을 정의하는 객체입니다.
        window = UIWindow(frame: UIScreen.main.bounds)
        // 윈도우를 표시하고 키 윈도우로 만듭니다.
        window?.makeKeyAndVisible()
        // 윈도우가 포함된 scene입니다.
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = navigationController
    }
}
