import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let webRepository = WebRepository(
            urlSession: URLSession.shared,
            host: "https://jsonplaceholder.typicode.com"
        )
        let repository = PlaceholderRepository(webRepository: webRepository)
        let rootViewController = ViewController(repository: repository)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
