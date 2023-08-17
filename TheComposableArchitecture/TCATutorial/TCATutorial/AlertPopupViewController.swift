import UIKit
import SnapKit
import Then
import Combine
import CombineCocoa
import ComposableArchitecture

final class AlertPopupViewController<Action>: UIViewController {
    private let button = UIButton(type: .system).then {
        $0.setTitle("Tap Button", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }

    private let store: Store<AlertPopupState<Action>, Action>
    private let viewStore: ViewStore<AlertPopupState<Action>, Action>
    private let action: Action
    
    private var cancellables = Set<AnyCancellable>()
    
    init(store: Store<AlertPopupState<Action>, Action>, action: Action) {
        self.store = store
        self.viewStore = ViewStore(store) {
            $0
        }
        self.action = action

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
        
        button.tapPublisher
            .sink { [unowned self] in
                viewStore.send(action)
                dismiss(animated: true)
            }
            .store(in: &cancellables)
    }
}

struct AlertPopupState<Action>: Equatable {
    let title: String
}
