import UIKit

//@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Providing the Main Entry Point
        
//    @main 진입 시 실행
//    static func main() {
//        print("AppDelegate::main()")
//        
//        print("AppDelegate::UIApplicationMain()")
//        UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self))
//    }
    
    // MARK: - Initializing the App
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate::application(_:willFinishLaunchingWithOptions:)")
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("AppDelegate::application(_:didFinishLaunchingWithOptions:)")
        return true
    }

    // MARK: - Configuring and Discarding Scenes

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("AppDelegate::application(_:configurationForConnecting:options:)")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("AppDelegate::application(_:didDiscardSceneSessions:)")
    }
    
    // MARK: - Responding to App Life Cycle Events
    
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        print("AppDelegate::applicationProtectedDataDidBecomeAvailable(_:)")
    }
    
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        print("AppDelegate::applicationProtectedDataWillBecomeUnavailable(_:)")
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("AppDelegate::applicationDidReceiveMemoryWarning(_:)")
    }
    
    func applicationSignificantTimeChange(_ application: UIApplication) {
        print("AppDelegate::applicationSignificantTimeChange(_:)")
    }
    
    // MARK: - Responding to Environment Changes
    
    // MARK: - Managing App State Restoration
    
    // MARK: - Downloading Data in the Background
    
    // MARK: - Handling Remote Notification Registration
    
    // MARK: - Continuing User Activity and Handling Quick Actions
    
    // MARK: - Interacting With WatchKit
    
    // MARK: - Interacting With HealthKit
    
    // MARK: - Opening a URL-Specified Resource
    
    // MARK: - Disallowing Specified App Extension Types
    
    // MARK: - Handling SiriKit Intents
    
    // MARK: - Handling CloudKit Invitations
    
    // MARK: - Managing Interface Geometry
}
