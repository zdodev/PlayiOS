import ComposableArchitecture

struct MainDomain: Reducer {
    struct State: Equatable {
        var count = CountDomain.State(number: 0)
    }
    
    enum Action {
        case count(CountDomain.Action)
    }
    
    var body: some ReducerOf<Self> {
//        Reduce { state, action in
//            switch action {
//            case .count:
//                print("ee")
//            }
//            return .none
//        }
        Scope(state: \.count, action: /Action.count) {
            CountDomain()
        }
    }
}
