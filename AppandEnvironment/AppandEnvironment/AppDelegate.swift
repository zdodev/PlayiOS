import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: main() 타입 메서드 구현
    // UIApplicationDelegate에 명시되어 있는 main() 메서드 명시적으로 구현.
    static func main() {
        print("call... main()")
        print("call... UIApplication(_:_:_:_:)")
        // UIApplicationMain(_:_:_:_:) 함수 호출
        UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(self))
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("call... application(_:didFinishLaunchingWithOptions:)")
        return true
    }
}
