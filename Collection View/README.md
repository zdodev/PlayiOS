# Collection Views

- `Collection View` 는 높은 커스텀 환경과 중첩된 뷰 레이아웃을 제공합니다.

---

`Collection View` 는 사진 앱의 그리드 형태의 사진과 같이 정렬된 콘텐츠를 관리하며 시각적으로 보여줍니다.

`Collection View` 는 다양한 객체 간의 요소로 이루어진 뷰입니다.

-   `Cell` 은 각 콘텐츠에 대한 내용을 보여주는 요소입니다.
-   `Layout` 은 collection view에서 콘텐츠의 시각적 배열을 나타냅니다.
-   데이터 소스 객체는 `UICollectionViewDataSource` 프로토콜을 채택하고 collection view에 데이터를 제공합니다.
-   델리게이트 객체는 `UICollectionViewDelegate` 프로토콜을 채택하고 선택을 하거나 강조 효과와 같은 collection view의 콘텐츠와 사용자와의 상호작용을 관리합니다.
-   일반적으로 collection view는 `UICollectionViewController` 객체를 사용하여 관리합니다. 다른 뷰 컨트롤러에서도 collection view를 사용할 수 있지만, 일부 collection과 관련된 기능이 작동하려면 collection view controller가 필요합니다.

# UICollectionView

---

`UICollectionView` 는 정렬된 데이터 항목 컬렉션을 관리하고 커스텀 레이아웃으로 보여주는 뷰입니다.

```swift
open class UICollectionView : UIScrollView, UIDataSourceTranslating {
  	public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
  	public init?(coder: NSCoder)
}
```

컬렉션 뷰는 `dataSource` 프로퍼티에 저장된 데이터 소스 객체로부터 데이터를 가져옵니다. 데이터 소스의 경우 사용자 인터페이스에 대한 업데이트를 간단하고 효율적으로 관리하는데 필요한 동작을 제공하는 `UICollectionViewDiffableDataSource` 를 사용할 수 있습니다. 또는 `UICollectionViewDataSource` 프로토콜을 채택하여 사용자 커스텀 데이터 소스를 생성할 수 있습니다.

컬렉션 뷰는 개별 항목으로 구성되며, 표현을 위해 섹션으로 그룹화할 수 있습니다. 항목은 표시할 데이터의 최소 단위입니다. 예를 들어 사진 앱의 경우 하나의 항목은 하나의 이미지일 수 있습니다. 컬렉션 뷰는 데이터 소스가 구성하고 제공하는 `UICollectionViewCell` 클래스의 인스턴스인 셀을 사용하여 화면에 항목을 표시합니다.

컬렉션 뷰는 셀 외에도 다른 타입의 뷰를 사용해서 데이터를 표시할 수 있습니다. 이 supplementary 뷰는 개별 셀과 분리되지만, 정보를 전달하는 섹션 헤더 및 바닥글일 수 있습니다. supplementary 뷰는 선택 사항이며 컬렉션 뷰의 레이아웃 객체에 의해 정의되며, 뷰의 배치를 정의하는 역할도 합니다.

Besides embedding a `UICollectionView` in your user interface, you use the methods of the collection view to ensure that the visual presentation of items matches the order in your data source object. A [`UICollectionViewDiffableDataSource`](https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource) object manages this process automatically. If you're using a custom data source, then whenever you add, delete, or rearrange data in your collection, you use the methods of `UICollectionView` to insert, delete, and rearrange the corresponding cells. 

You also use the collection view object to manage the selected items, although for this behavior the collection view works with its associated [`delegate`](https://developer.apple.com/documentation/uikit/uicollectionview/1618033-delegate) object.

## UICollectionView 에서 다루는 기능

-   Collection View 생성
-   Collection View 데이터 제공
    -   UICollectionViewDiffableDataSource 방식
    -   UICollectionViewDataSource 방식
-   Collection View 셀 및 데이터 프리패치
-   Collection View 사용자 상호작용
-   셀 생성
    -   UICollectionView.CellRegistration 방식
    -   register() 방식
-   헤더와 푸터 생성
    -   UICollectionVIew.SupplementaryRegistration 방식
    -   register() 방식
-   백그라운드 뷰 설정
-   레이아웃 변경
-   Collection View 상태 확인
-   항목 삽입, 이동, 삭제
-   섹션 삽입, 이동, 삭제
-   인터랙티브 항목 재정렬
-   드래그 인터랙션 관리
-   드랍 인터랙션 관리
-   셀 선택 관리
-   Collection View edit mode 설정
-   레이아웃 정보 확인
-   항목 스크롤
-   Animating Multiple Changes to the Collection View
-   콘텐츠 리로딩
-   Collection View 요소 식별
-   마지막 포커스 셀 기억

## Layouts

---

레이아웃 객체는 컬렉션 뷰에서 내용의 시각적 배열을 정의합니다. `UICollectionViewLayout` 클래스의 하위 클래스인 레이아웃 객체는 모든 셀과 컬렉션 뷰 내부의 supplementary 뷰의 구성과 위치를 정의합니다. 레이아웃 객체는 위치를 정의하지만, 해당 뷰에 실제로 해당 정보를 적용하지는 않습니다. 컬렉션 뷰는 셀 및 supplementary 뷰를 생성할 때 컬렉션 뷰와 데이터 소스 객체간의 정보가 포함되므로 해당 뷰에 레이아웃 정보를 적용합니다. 레이아웃 객체는 항목 데이터 대신 시각적 정보를 제공한다는 점을 제외하면 다른 데이터 소스와 같습니다.

일반적으로 컬렉션 뷰를 만들 때 레이아웃 객체를 지정하지만, 컬렉션 뷰의 레이아웃을 동적으로 변경할 수도 있습니다. 이 레이아웃 객체는 `collectionViewLayout` 프로퍼티에 저장됩니다. 이 프로퍼티를 변경하면 변경사항에 대한 애니메이션 효과 없이 레이아웃이 즉시 업데이트됩니다. 변경사항에 애니메이션 효과를 적용하려면 대신에 `setCollectionViewLayout(_:animated:completion:)` 메서드를 호출해야 합니다.

gesture recognizer 또는 터치 이벤트에 의해 구동되는 대화형 전환을 만들려면 `startInteractiveTransition(to:completion:)` 메서드를 사용하여 레이아웃 객체를 변경해야 합니다. 이 메서드는 gesture recognizer 또는 터치 이벤트 코드와 함께 작동하여 전환 진행률을 추적하는 중간 레이아웃 객체를 설치합니다. 이벤트 처리 코드에서 전환이 완료되었다고 판단하면 `finishInteractiveTransition()` 또는 `cancelInteractiveTransition()` 메서드를 호출하여 중간 레이아웃 객체를 제거하고 원하는 대상 레이아웃 객체를 설치합니다.

## Cells and Supplementary Views

---

컬렉션 뷰의 데이터 소스 객체는 항목에 대한 콘텐츠와 해당 콘텐츠를 표시하는 데 사용하는 뷰를 제공합니다. 컬렉션 뷰가 콘텐츠를 처음 불러올 때 데이터 소스에 표시되는 각 항목에 대한 뷰를 제공하도록 요청합니다. 컬렉션 뷰는 데이터 소스가 재사용을 위해 표시한 뷰 객체의 큐 또는 리스트를 유지합니다. 명시적으로 새 뷰를 만드는 대신 항상 대기열 큐에 저장된 뷰를 사용합니다.

대기열 큐에 있는 뷰를 사용하는 방법은 두 가지가 있습니다. 뷰를 요청하는 유형에 따라 다릅니다.

-   `dequeueReusableCell(withReuseIdentifier:for:)` 메서드를 사용하여 컬렉션 뷰의 항목에 대한 셀을 가져올 수 있습니다.
-   `dequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:)` 메서드를 사용하여 레이아웃 객체에서 요청한 보충 뷰를 가져올 수 있습니다.

## 리스트 레이아웃 구성하기

---

```swift
// Creating a List Layout
// 리스트 레이아웃을 만들기 위한 구성입니다.
let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
// Creating a List Layout
// 지정된 구성의 리스트 섹션만 포함하는 컴포지션 레이아웃을 만듭니다.
return UICollectionViewCompositionalLayout.list(using: config)
```

## 리스트 레이아웃 구성을 위한 `UICollectionLayoutListConfiguration`

리스트 레이아웃 생성을 위한 구성을 담고 있는 타입입니다.

다음과 같은 구성을 할 수 있습니다.

-   레이아웃 외관에 대한 구성
-   외관에 대한 구성
-   헤더와 푸터에 대한 구성
-   스와이프 액션에 대한 구성

## Collection View List Layout 구성요소

-   UICollectionView
-   UICollectionViewDiffableDataSource
-   NSDiffableDataSourceSnapshot
-   UICollectionLayoutListConfiguration
-   UICollectionViewCompositionalLayout
-   NSDiffableDataSourceSnapshot
-   UICollectionViewListCell
-   UICellConfigurationState
-   UIContentConfiguration
-   UICellConfiguration
-   UICellConfigurationState

## Content View

------

A content view is a UIView subclass that conforms to the UIContentView protocol. It defines the layout and appearance of the custom cell. It is also in charge of displaying the correct data and appearance based on the provided content configuration.

## Content Configuration

------

A content configuration will be the content view's view model and it is conforms to the UIContentConfiguration protocol. On the of that, it is also in charge of generating a content view instance for the custom cell. Thus, you can treat it as a bridge that links up both content view and custom cell.

## Custom Cell

------

A custom cell of a UICollectionView list is a subclass of UICollectionViewListCell. It has only 1 task - generate a properly configured content configuration object based on the state (selected, highlighted, disabled, etc.) of the cell and then assign the configuration to itself.

## Custom Cell은 contentView를 가지고 있다.

---

contentView에 구성할 컴포넌트를 추가하고 constraint를 주자. 그러면 레이아웃이 잡힐지니.

## 섹션 헤더 뷰는 어떻게 업데이트 할 것인가?

---

Reloading Data topic에 있는 reloadItem(), reloadSections()를 해도 안된다. `NSDiffableDataSourceSnapshot` 에서는 참조 타입과 값 타입의 업데이트 방법이 다른 듯 하다. 현재 섹션 헤더 뷰는 값 타입을 사용하고 있으므로 섹션 헤더를 지우고, 값을 업데이트하고 다시 콜렉션 뷰에 데이터를 적용하는 방식으로 업데이트를 하였다.

## Issues

---

Collection view를 `UICollectionView()` 메서드로 초기화하면 에러가 발생합니다.

>   UICollectionView must be initialized with a non-nil layout parameter

`layout` 파라미터가 없어서 발생한 에러로 `collectionViewLayout` 파라미터를 전달하여 생성하면 에러를 방지할 수 있습니다.

### 참고 URL

---

>[Apple Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views)
>
>[Apple Implementing Modern Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)
>
>[Apple Changing the Appearance of Selected and Highlighted Cells](https://developer.apple.com/documentation/uikit/uicollectionviewdelegate/changing_the_appearance_of_selected_and_highlighted_cells)
>
>[Apple Selecting Multiple Items with a Two-Finger Pan Gesture](https://developer.apple.com/documentation/uikit/uitableviewdelegate/selecting_multiple_items_with_a_two-finger_pan_gesture)
>
>[Apple Supporting Drag and Drop in Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/supporting_drag_and_drop_in_collection_views)
>
>[The Modern Ways to Reload Your Table and Collection View Cells](https://swiftsenpai.com/development/modern-ways-reload-cells/)