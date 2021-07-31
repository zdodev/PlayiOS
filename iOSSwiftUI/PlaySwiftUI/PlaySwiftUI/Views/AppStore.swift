import Foundation

typealias AppStore = Store<AppState, AppAction>

// ObservableObject 앱 상태를 가지고 있는 옵저버블 오브젝트 스토어
final class Store<State, Action>: ObservableObject {
    // 외부에서 읽을수만 있도록 private(set) 설정
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(state: State, reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.reducer = reducer
    }
    
    // 디스패치를 통해 액션 수행
    func dispatch(action: Action) {
        // 리듀서를 실행해서 액션 처리
        reducer(&state, action)
    }
}
