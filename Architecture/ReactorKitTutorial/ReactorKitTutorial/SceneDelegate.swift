//
//  SceneDelegate.swift
//  ReactorKitTutorial
//
//  Created by admin on 2022/08/29.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        let viewController = CountViewController()
        viewController.reactor = CountViewReactor()
        window.rootViewController = viewController
    }
}
