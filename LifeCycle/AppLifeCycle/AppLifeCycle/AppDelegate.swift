import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Initializing the app
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("launchOptions = \(launchOptions as Any)")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("launchOptions = \(launchOptions as Any)")
        return true
    }
    
    // MARK: - Configuring and discarding scenes
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("connectingSceneSession = \(connectingSceneSession)")
        print("options = \(options)")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("sceneSessions = \(sceneSessions)")
    }
    
    // MARK: - Responding to app life-cycle events
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("⭐️ \(#function)")
        print("application = \(application)")
    }
    
    // MARK: - Responding to environment changes
    
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        print("⭐️ \(#function)")
        print("application = \(application)")
    }
    
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        print("⭐️ \(#function)")
        print("application = \(application)")
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("⭐️ \(#function)")
        print("application = \(application)")
    }
    
    func applicationSignificantTimeChange(_ application: UIApplication) {
        print("⭐️ \(#function)")
        print("application = \(application)")
    }
    
    // MARK: - Managing app state restoration
    
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("coder = \(coder)")
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("coder = \(coder)")
        return true
    }
    
    func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("identifierComponents = \(identifierComponents)")
        print("coder = \(coder)")
        return nil
    }
    
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("coder = \(coder)")
    }
    
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("coder = \(coder)")
    }
    
    // MARK: - Downloading data in the background
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String) async {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("identifier = \(identifier)")
    }
    
    // MARK: - Handling remote notification registration
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("deviceToken = \(deviceToken)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("error = \(error)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("userInfo = \(userInfo)")
        return .noData
    }
    
    // MARK: - Interacting with WatchKit
    
    func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?) async -> [AnyHashable : Any]? {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("userInfo = \(userInfo as Any)")
        return nil
    }
    
    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        print("⭐️ \(#function)")
        print("application = \(application)")
    }
    
    // MARK: - Opening a URL-specified resource
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("⭐️ \(#function)")
        print("app = \(app)")
        print("url = \(url)")
        print("options = \(options)")
        return true
    }
    
    // MARK: - Disallowing specified app extension types
    
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("extensionPointIdentifier = \(extensionPointIdentifier)")
        return true
    }
    
    // MARK: - Handling SiriKit itents
    // func application( _ application: UIApplication, handlerFor intent: INIntent ) -> Any?
    
    // MARK: - Handling CloudKit invitations
    
    // application( _ application: UIApplication, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShareMetadata )
    
    // MARK: - Localizing keyboard shortcuts
    
    func applicationShouldAutomaticallyLocalizeKeyCommands(_ application: UIApplication) -> Bool {
        print("⭐️ \(#function)")
        print("application = \(application)")
        return true
    }
    
    // MARK: - Managing interface geometry
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        print("⭐️ \(#function)")
        print("application = \(application)")
        print("window = \(window as Any)")
        return .all
    }
}
