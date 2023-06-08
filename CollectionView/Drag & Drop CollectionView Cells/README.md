# Drag & Drop CollectionView Cells

## 컬렉션 뷰 셀 재배치하기

![ezgif com-resize](https://user-images.githubusercontent.com/67548251/114660708-bb390780-9d30-11eb-900b-c8bff9522b3a.gif)

컬렉션 뷰를 사용하여 셀을 재배치하는 예제입니다.

컬렉션 뷰와 레이아웃을 정의합니다.



터치로 드래그 엔 드랍을 하기 위해 UILongPressGestureRecognizer 제스처를 정의하고 컬렉션 뷰에 등록합니다.

컬렉션 뷰에 지정한 항목이 다른 위치로 이동할 수 있도록 합니다.

```swift
func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
    true
}
```

컬렉션 뷰에 지정한 항목이 새로운 위치로 이동하도록 합니다.

```swift
func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let item = colors.remove(at: sourceIndexPath.row)
    colors.insert(item, at: destinationIndexPath.row)
}
```

### 참고 링크

---

>   [Drag & Drop CollectionView Cells (Swift 5) - Xcode 11 - 2020](https://www.youtube.com/watch?v=VrW_6EixIVQ)