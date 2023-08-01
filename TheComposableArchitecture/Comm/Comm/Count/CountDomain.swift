import ComposableArchitecture

struct CountDomain: Reducer {
    struct State: Equatable {
        var number: Int
    }
    
    enum Action {
        case tappedPlusButton
        case tappedMinusButton
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tappedPlusButton:
                state.number += 1
            case .tappedMinusButton:
                state.number -= 1
            }
            return .none
        }
    }
}
