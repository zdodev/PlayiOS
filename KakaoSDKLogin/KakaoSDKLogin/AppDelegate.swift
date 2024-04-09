import UIKit
import SnapKit
import KakaoSDKCommon

@main
final class AppDelegate: UIResponder, UIApplicationDelegate { 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        KakaoSDK.initSDK(appKey: "d0bbd9e4287673df1bb53bfb17b8e4c7")
        
        return true
    }
}
