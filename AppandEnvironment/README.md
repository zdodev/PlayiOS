## SceneBasedLifeCycle

Scene 기반 앱의 라이프사이클을 추적해보았습니다.

## App and Environment

- 앱의 라이프 사이클 이벤트와 UI scene을 관리하고 앱이 실행되는 환경과 특성에 대한 정보를 얻을 수 있습니다.

---

- iOS 13 이상에서는 앱 사용자 인터페이스의 여러 인스턴스를 동시에 생성하고 관리하고 app switcher를 사용하여 인스턴스 간 전환을 할 수 있습니다. iPad에서는 앱의 여러 인터페이스를 나란히 표시할 수 있습니다. UI의 각 인스턴스는 서로 다른 콘텐츠를 표시하거나 동일한 콘텐츠를 다른 방식으로 표시합니다. 예를 들어, 사용자는 일정관리 앱의 인스턴스 하나는 특정 날짜를 표시하고 다른 인스턴스는 전체 월을 표시할 수 있습니다.
- UIKit은 디바이스 설정, 인터페이스 설정 및 사용자 환경 설정의 조합을 반영하는 trait collections를 사용하여 현재 환경에 대한 세부 사항을 전달합니다. 예를 들어 trait를 사용하여 현재 뷰와 뷰 컨트롤러에 대해 다크 모드가 활성 상태인지 탐지할 수 있습니다. 현재 환경을 기준으로 콘텐츠를 커스텀하려면 `UIView` 또는 `UIViewController` 객체의 현재 trait collection을 참조합니다. trait notification change를 수신하려면 다른 객체에 `UITraitEnvironment` 프로토콜을 채택합니다.

## 참고 URL

### App and Environment
https://developer.apple.com/documentation/uikit/app_and_environment