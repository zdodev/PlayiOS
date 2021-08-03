import SwiftUI

// App, 앱의 구조와 동작을 나타내는 프로토콜
// 앱의 초기 진입점
@main
struct PlaySwiftUIApp: App {
    // body 프로퍼티 구현
    var body: some Scene {
        WindowGroup {
//            ContentView()
            DiceView()
        }
    }
}
