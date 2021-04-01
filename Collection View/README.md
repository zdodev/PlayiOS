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

## Layouts

레이아웃 객체는 컬렉션 뷰에서 내용의 시각적 배열을 정의합니다. `UICollectionViewLayout` 클래스의 하위 클래스인 레이아웃 객체는 모든 셀과 컬렉션 뷰 내부의 supplementary 뷰의 구성과 위치를 정의합니다. 레이아웃 객체는 위치를 정의하지만, 해당 뷰에 실제로 해당 정보를 적용하지는 않습니다. 컬렉션 뷰는 셀 및 supplementary 뷰를 생성할 때 컬렉션 뷰와 데이터 소스 객체간의 정보가 포함되기 해당 뷰에 레이아웃 정보를 적용합니다. 레이아웃 객체는 항목 데이터 대신 시각적 정보를 제공한다는 점을 제외하면 다른 데이터 소스와 같습니다.

일반적으로 컬렉션 뷰를 만들 때 레이아웃 객체를 지정하지만, 컬렉션 뷰의 레이아웃을 동적으로 변경할 수도 있습니다. 이 레이아웃 객체는 `collectionViewLayout` 프로퍼티에 저장됩니다. 이 프로퍼티를 변경하면 변경사항에 대한 애니메이션 효과 없이 레이아웃이 즉시 업데이트됩니다. 변경사항에 애니메이션 효과를 적용하려면 대신에 `setCollectionViewLayout(_:animated:completion:)` 메서드를 호출해야 합니다.

gesture recognizer 또는 터치 이벤트에 의해 구동되는 대화형 전환을 만들려면 `startInteractiveTransition(to:completion:)` 메서드를 사용하여 레이아웃 객체를 변경해야 합니다. 이 메서드는 gesture recognizer 또는 터치 이벤트 코드와 함께 작동하여 전환 진행률을 추적하는 중간 레이아웃 객체를 설치합니다. 이벤트 처리 코드에서 전환이 완료되었다고 판단하면 `finishInteractiveTransition()` 또는 `cancelInteractiveTransition()` 메서드를 호출하여 중간 레이아웃 객체를 제거하고 원하는 대상 레이아웃 객체를 설치합니다.

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
>