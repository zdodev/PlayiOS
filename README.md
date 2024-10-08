# PlayiOS
iOS 놀이공간입니다.

local account

## UIView에 테두리 추가하기
```swift
extension CALayer {
    func addBorder(_ edges: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in edges {
            let border = CALayer()
            switch edge {
            case .top:
                addBorderEdge(border, x: 0, y: 0, width: frame.width, height: width)
            case .bottom:
                addBorderEdge(border, x: 0, y: frame.height - width, width: frame.width, height: width)
            case .left:
                addBorderEdge(border, x: 0, y: 0, width: width, height: frame.height)
            case .right:
                addBorderEdge(border, x: frame.width - width, y: 0, width: width, height: frame.height)
            default:
                break
            }
        }
        
        func addBorderEdge(_ border: CALayer, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
            border.frame = CGRect(x: x, y: y, width: width, height: height)
            border.backgroundColor = color.cgColor
            addSublayer(border)
        }
    }
}
```

## App Link

-   외부에서 링크를 통해 앱을 실행합니다.

## File System

- iOS 파일 시스템에 대한 기록입니다.

## 스택 뷰

- 스택 뷰 생성 및 설정

### iOS 라이프사이클

- 앱 라이프사이클
- 뷰 컨트롤러 라이프사이클

### Core Location을 활요한 위치 구하기

- Core Location을 활용하여 위치 정보 구하기

### Table View를 활용한 화면 구현

- 테이블 뷰, 커스텀 셀, 데이터 소스를 활용

### SocketNetworking

- 소켓을 사용한 네트워크 통신을 구현합니다.
- 로컬 서버를 이용합니다.

### Pass Data

- 객체(뷰 컨트롤러) 간에 데이터를 전달하는 방법을 구현 정리해보았습니다.

### ArchitecturePattern

-   iOS 아키텍처 패턴에 대해 정리해보았습니다.
-   MVC 패턴 개념 정리

### Collection View

-   Collection View 사용해보기.
-   Carousel Effect!!!

### Drag and Drop

-   Drag and drop 사용해보기.

### Auto Layout

-   코드로 auto layout 구현하기(auto layout programmatically)
-   다양한 뷰 레이아웃

### User Notifications

-   User Notifications 정리

### Delegate Pattern

- Protocol, Delegate, Implement 구현

### UISplitViewController

- 계층적 인터페이스를 구현하는 뷰 컨트롤러

## Carousel
