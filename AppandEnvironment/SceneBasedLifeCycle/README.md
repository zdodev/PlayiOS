## SceneBasedLifeCycle

Scene 기반의 라이프사이클 이벤트 추적은 `UISceneDelegate` 프로토콜을 채택한 객체에서 담당합니다. `UIWindowSceneDelegate` 프로토콜은 `UISceneDelegate` 프로토콜을 상속하고 있습니다.

![1](https://user-images.githubusercontent.com/67548251/117422514-a3812780-af5a-11eb-88bd-2482f803f7f8.png)

### scene(_:willConnectTo:options:)

- scene 생성 -> scene 연결 시

### sceneWillEnterForeground(_:)

- Unattached -> Inactive 시

### sceneDidBecomeActive(_:)

- Inactive -> Active 이후

### sceneWillResignActive(_:)

- Active -> Inactive 시

### sceneDidEnterBackground(_:)

- Inactive -> Background 이후

### sceneDidDisconnect(_:)

- Background -> Unattached 이후