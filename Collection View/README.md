# Collection Views

- `Collection View` 는 높은 커스텀 환경과 중첩된 뷰 레이아웃을 제공합니다.

---

`Collection View` 는 사진 앱의 그리드 형태의 사진과 같이 정렬된 콘텐츠를 관리하며 시각적으로 보여줍니다.

`Collection View` 는 다양한 객체들 간의 요소로 이루어진 뷰입니다.

-   `Cell` 은 각 콘텐츠에 대한 내용을 보여주는 요소입니다.
-   `Layout` 은 collection view에서 콘텐츠의 시각적 배열을 나타냅니다.
-   데이터 소스 객체는 `UICollectionViewDataSource` 프로토콜을 채택하고 collection view에 데이터를 제공합니다.
-   델리게이트 객체는 `UICollectionViewDelegate` 프로토콜을 채택하고 선택을 하거나 강조 효과와 같은 collection view의 콘텐츠와 사용자와의 상호작용을 관리합니다.
-   일반적으로 collection view는 `UICollectionViewController` 객체를 사용하여 관리합니다. 다른 뷰 컨트롤러에서도 collection view를 사용할 수 있지만 일부 collection과 관련된 기능이 작동하려면 collection view controller가 필요합니다.

### 참고 URL

---

>[Apple Collection Views](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views)