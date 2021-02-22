## UIResponder
- 이벤트에 응답하고 처리하기 위한 추상 인터페이스입니다.

### 개요

UIResponder의 인스턴스인 responder 객체는 UIKit 애플리케이션의 이벤트 처리의 근간입니다. UIApplication, UIViewController, UIView, UIWindow 객체를 포함한 많은 객체들이 responder입니다. 이벤트가 발생하면 UIKit은 이벤트를 처리하기 위해 앱의 responder로 전송합니다.

이벤트에는 터치 이벤트, 모션 이벤트, 원격 제어 이벤트, 프레스 이벤트 등 여러 종류의 이벤트가 있습니다. 특정 유형의 이벤트를 처리하려면 responder에서 해당 메서드를 오버라이드해야 합니다. 예를 들어 터치 이벤트를 처리하려면 responder에서 `touchesBegan(_:with:)`, `touchesMoved(_:with:)`, `touchesEnded(_:with:)` 및 `touchesCancelled(_:with:)` 메서드를 구현해야 합니다. 터치의 경우 responder는 UIKit에서 제공하는 이벤트 정보를 사용하여 해당 처티의 변경사항을 추적하고 앱 인터페이스를 적절하게 업데이트합니다.

UIKit responder는 이벤트 처리 외에도 처리되지 않은 이벤트를 앱의 다른 부분으로 전달하는 작업도 관리합니다. 지정된 responder가 이베트를 처리하지 않으면, 해당 이벤트를 responder 체인의 다음 이벤트로 전달합니다. UIKit은 사전에 정의된 규칙을 사용하여 이벤트를 수신할 객체를 결정하는 responder 체인을 동적으로 관리합니다. 예를 들어 뷰는 이벤트를 상위 뷰로 전달하고 최상위 뷰는 뷰 컨트롤러로 전달합니다.

responder는 UIEvent 객체를 처리하지만 입력 뷰를 통해 사용자 정의 입력 입력을 허용할 수 있습니다. 시스템의 키보드가 입력 뷰의 가장 명확한 예시입니다. 사용자가 UITextField나 UITextView를 화면에서 탭을 했을 때 그 뷰는 first responder가 되고 그 뷰의 입력 뷰인 시스템 키보드를 보여주게 됩니다. 마찬가지로 사용자 정의 입력 뷰를 정의할 수 있으며 다른 responder가 활성화될 때 해당 사용자 정의 입력 뷰를 보여줄 수 있습니다. 사용자 정의 입력 뷰와 responder를 연결하려면 해당 뷰를 responder의 `inputView` 프로퍼티에 할당하면 됩니다.

참고 링크

- Apple UIResponder
- https://developer.apple.com/documentation/uikit/uiresponder

