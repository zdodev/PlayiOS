import UIKit
import SnapKit
import Then
import Combine
import CombineCocoa
import ComposableArchitecture

final class ViewController: UIViewController {
    private let store: StoreOf<ViewDomain>
    private let viewStore: ViewStoreOf<ViewDomain>
    private let button = UIButton(type: .system).then {
        $0.setTitle("Start", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        store = Store(
            initialState: ViewDomain.State(alertPopup: .init(title: "ee")),
            reducer: {
                ViewDomain()
            })
        viewStore = ViewStore(store) {
            $0
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        button.tapPublisher.sink { [unowned self] in
            let store = store.scope(state: \.alertPopup, action: { .alertTap($0) })
            let alert = AlertPopupViewController(store: store, action: .dismiss)
            present(alert, animated: true)
        }
        .store(in: &cancellables)
    }
}

struct ViewDomain: Reducer {
    struct State: Equatable {
        var alertPopup: AlertPopupState<Action.Alert>
    }
    
    enum Action {
        case tap
        case alertTap(Alert)
        
        enum Alert {
            case dismiss
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tap:
                print("tap!")
            case .alertTap(.dismiss):
                print("dismiss!")
            }
            return .none
        }
    }
}
