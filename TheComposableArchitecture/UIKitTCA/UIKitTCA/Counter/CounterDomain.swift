import ComposableArchitecture

struct Counter: ReducerProtocol {
    struct State: Equatable {
        var count = 0
    }
    
    enum Action: Equatable {
        case incrementButtonTapped
        case decrementButtonTapped
    }
    
    var body: some ReducerProtocolOf<Counter> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
                return .none
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            }
        }
    }
}
