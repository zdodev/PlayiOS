# UISplitViewController란 무엇인가.
- 계층적 인터페이스를 구현하는 뷰 컨트롤러입니다.
- 스플릿 뷰 컨트롤러는 내비게이션 스택에 push 할 수 없습니다.

## 스플릿 뷰 스타일
- `init(style:)` 이니셜라이저를 사용하여 두 개 또는 세 개의 컬럼의 스플릿 뷰 인터페이스를 생성할 수 있습니다.
- `UISplitViewController.Style.doubleColumn` 은 두 개의 하위 뷰 컨트롤러 인터페이스를 관리합니다.
- `UISplitViewController.Style.tripleColumn` 은 세 개의 하위 뷰 컨트롤러 인터페이스를 관리합니다.

## 하위 뷰 컨트롤러
- `setViewController(_:for)` 를 사용하여 뷰 컨트롤러를 설정합니다.
- 스플릿 뷰 컨트롤러는 내비게이션 컨트롤러에서 모든 하위 뷰 컨트롤러를 래핑합니다.
- `show(_:)`, `hide(_:)` 메서드를 사용하여 해당 컬럼을 표시하거나 숨길 수 있습니다.

- 인터페이스 빌더를 사용하거나 프로그래밍 방식으로 하위 뷰 컨트롤러를 구성할 수 있습니다.
- `viewControllers` 프로퍼티를 사용하여 하위 뷰 컨트롤러를 구성할 수 있습니다.
- 기본 또는 보조 뷰 컨트롤러를 변경해야 하는 경우 `show(_:sender)` 및 `showDetailViewController(_:sender:)` 메서드를 사용하는 것이 좋습니다.

## 인터페이스 전환
- 