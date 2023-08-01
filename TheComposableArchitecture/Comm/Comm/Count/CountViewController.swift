import UIKit
import SwiftUI
import Combine
import ComposableArchitecture
import SnapKit
import Then
import CombineCocoa

final class CountViewController: UIViewController {
    private let countLabel = UILabel()
    private let plusButton = UIButton(type: .system).then {
        $0.setImage(
            UIImage(systemName: "plus"),
            for: .normal
        )
    }
    private let minusButton = UIButton(type: .system).then {
        $0.setImage(
            UIImage(systemName: "minus"),
            for: .normal
        )
    }
    
    private let store: StoreOf<CountDomain>
    private let viewStore: ViewStoreOf<CountDomain>
    private var cancellables = Set<AnyCancellable>()
    
    init(store: StoreOf<CountDomain>) {
        self.store = store
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
        
        view.addSubview(countLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().multipliedBy(1.5)
        }
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().multipliedBy(0.5)
        }
        
        viewStore.publisher
            .map { "\($0.number)" }
            .assign(to: \.countLabel.text, on: self)
            .store(in: &cancellables)
        
        plusButton.tapPublisher.sink { [unowned self] in
            viewStore.send(.tappedPlusButton)
        }
        .store(in: &cancellables)
        minusButton.tapPublisher.sink { [unowned self] in
            viewStore.send(.tappedMinusButton)
        }
        .store(in: &cancellables)
    }
}

struct CountViewController_Previews: PreviewProvider {
    static var previews: some View {
        CountViewController(store: Store(initialState: CountDomain.State(number: 0)) {
            CountDomain()
        }).preview
    }
}
