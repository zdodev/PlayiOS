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



## 뷰 컨트롤러 라이프사이클 및 이벤트

뷰 컨트롤러 라이프사이클 및 발생 이벤트 메서드 순서 정리

### 뷰 컨트롤러 생성 시 호출되는 메서드 순서

- loadView()
- viewDidLoad()
- viewWillAppear(_:)
- updateViewConstraints() // 첫 실행 시에만
- viewWillLayoutSubviews()
- viewDidLayoutSubviews()
- viewDidAppear(_:)

### 내비게이션 바를 통해 다음 뷰 컨트롤러 생성 호출 시

- loadView() - 새로운 뷰 컨트롤러
- viewDidLoad() - 새로운 뷰 컨트롤러
- viewWillDisappear(_:) - 이전 뷰 컨트롤러
- viewWillAppear(_:) - 새로운 뷰 컨트롤러
- viewWillLayoutSubviews() - 새로운 뷰 컨트롤러
- viewDidLayoutSubviews() - 새로운 뷰 컨트롤러
- viewDidDisappear(_:) - 이전 뷰 컨트롤러
- viewDidAppear(_:) - 새로운 뷰 컨트롤러

### 내비게이션 바를 통해 이전 뷰 컨트롤러로 이동 시

- viewWillDisappear(_:) - 현재 뷰 컨트롤러
- viewWillAppear(_:) - 이동할 뷰 컨트롤러
- viewDidDisappear(_:) - 현재 뷰 컨트롤러
- viewDidAppear(_:) - 이동할 뷰 컨트롤러

### 화면 방향 전환 시(가로, 세로)

- viewWillTransition(to:with:)
- viewWillLayoutSubviews()
- viewDidLayoutSubviews()
