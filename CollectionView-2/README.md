## CollectionView-2

Split view controller 예제.

- 🚨: `DetailViewController`에서 `refreshUI` 메서드에서 `loadViewIfNeeded` 메서드를 호출하지 않으면 에러가 발생하는 이유는?
  - `loadViewIfNeeded()`: Loads the view controller’s view if it has not yet been loaded.
  - `loadViewIfNeeded()` 메서드는 UIViewController의 메서드로 뷰 컨트롤러의 뷰가 로드되지 경우 뷰 컨트롤러의 뷰를 로드합니다. 그러나 `refreshUI` 메서드를 호출은 `scene(_:willConnectTo:options:)` 메서드 내에서 호출되므로 아직 뷰 컨트롤러의 뷰가 아직 로드되기 이전이기 때문에 `loadViewIfNeeded()` 메서드를 호출하지 않을 경우 에러가 발생합니다. 따라서 `loadViewIfNeeded()`를 호출하여 뷰가 로드된 것을 보장해야 에러가 발생하지 않습니다.