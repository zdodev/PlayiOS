# PlayiOS
iOS 놀이공간

# SceneDelegate에서 View Controller 생성하기

```swift
guard let windowScene = (scene as? UIWindowScene) else { return }

let viewController = ViewController()
window = UIWindow(frame: UIScreen.main.bounds)
window?.rootViewController = viewController
window?.makeKeyAndVisible()
window?.windowScene = windowScene
```