import UIKit
import Combine
import CombineCocoa
import ComposableArchitecture

struct Counter: ReducerProtocol {
    struct State: Equatable {
        var count = 0
    }
    
    enum Action: Equatable {
        case increaseCounter
        case decreaseCounter
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .increaseCounter:
            state.count += 1
            return .none
        case .decreaseCounter:
            state.count -= 1
            return .none
        }
    }
}

final class CounterViewController: UIViewController {
    private lazy var counterView = CounterView(viewStore: viewStore)
    
    let viewStore: ViewStoreOf<Counter>
    private var anyCancellables = Set<AnyCancellable>()
    
    init() {
        viewStore = ViewStore(Store(initialState: Counter.State()) {
            Counter()
        })
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        viewStore = ViewStore(Store(initialState: Counter.State()) {
            Counter()
        })
        
        super.init(coder: coder)
    }
                              
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(counterView)
        
        counterView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
}
