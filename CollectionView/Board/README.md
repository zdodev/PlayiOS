# Board

---

## Providing the Collection View Data

### UICollectionViewDiffableDataSource

```swift
class UICollectionViewDiffableDataSource<SectionIdentifierType, ItemIdentifierType> : NSObject, UICollectionViewDataSource where SectionIdentifierType : Hashable, ItemIdentifierType : Hashable
```

데이터를 관리하고 컬렉션 뷰에 셀을 제공하는 데 사용합니다.



