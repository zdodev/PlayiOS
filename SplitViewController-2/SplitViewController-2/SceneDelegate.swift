import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let splitViewController = window?.rootViewController as? UISplitViewController,
              let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
              let masterViewController = leftNavController.viewControllers.first as? MasterViewController,
              let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController
        else {
            fatalError()
        }
        splitViewController.preferredPrimaryColumnWidthFraction = 1 / 3
        splitViewController.preferredDisplayMode = .oneBesideSecondary
        
        // masterViewController에 존재하는 모델에 접근
        let firstMonster = masterViewController.monsters.first
        // detailViewcontroller에 모델 전달
        detailViewController.monster = firstMonster
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        masterViewController.delegate = detailViewController
    }
}

