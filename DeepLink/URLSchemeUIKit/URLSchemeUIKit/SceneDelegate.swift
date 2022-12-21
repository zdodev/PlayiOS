import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var isLaunchedOpenURL = false
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        if isLaunchedOpenURL(options: connectionOptions) {
            presentOpenURLViewController(windowScene, openURLContexts: connectionOptions.urlContexts)
            return
        }
        
        presentBaseViewController(windowScene)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        presentOpenURLViewController(windowScene, openURLContexts: URLContexts)
    }
    
    private func isLaunchedOpenURL(options connectionOptions: UIScene.ConnectionOptions) -> Bool {
        !connectionOptions.urlContexts.isEmpty
    }
    
    private func presentOpenURLViewController(_ windowScene: UIWindowScene, openURLContexts urlContexts: Set<UIOpenURLContext>) {
        if let urlContext = urlContexts.first {
            if let person = parseOpenSchemeURL(
                Person.self,
                url: urlContext.url
            ) {
                let window = UIWindow(windowScene: windowScene)
                let viewModel = OpenURLViewModel(person: person)
                let viewController = OpenURLViewController(viewModel: viewModel)
                window.rootViewController = viewController
                window.makeKeyAndVisible()
                self.window = window
            }
        }
    }
    
    private func presentBaseViewController(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let viewController = BaseViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

extension SceneDelegate {
    func parseOpenSchemeURL<T: Decodable>(_ type: T.Type, url: URL) -> T? {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        guard let queryItems = urlComponents.queryItems else {
            return nil
        }
        let queryDictionary = queryItems.reduce(into: [String: String]()) { partialResult, queryItem in
            if let value = queryItem.value {
                partialResult[queryItem.name] = value
                return
            }
            partialResult[queryItem.name] = ""
        }
        guard let queryJSON = try? JSONEncoder().encode(queryDictionary) else {
            return nil
        }
        guard let decodedQuery = try? JSONDecoder().decode(T.self, from: queryJSON) else {
            return nil
        }
        
        return decodedQuery
    }
}
