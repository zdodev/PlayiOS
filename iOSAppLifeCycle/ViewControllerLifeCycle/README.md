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