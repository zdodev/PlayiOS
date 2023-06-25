import UIKit
import Combine

import SnapKit
import Then
import ComposableArchitecture

final class CounterView: UIView {
    private let minusButton = UIButton(type: .system).then {
        $0.setImage(
            UIImage(systemName: "minus"),
            for: .normal
        )
    }
    private let plusButton = UIButton(type: .system).then {
        $0.setImage(
            UIImage(systemName: "plus"),
            for: .normal
        )
    }
    private let label = UILabel().then {
        $0.font = .systemFont(
            ofSize: 18,
            weight: .black
        )
    }
    
    private let viewStore: ViewStoreOf<Counter>
    private var cancellables = Set<AnyCancellable>()
    
    init(viewStore: ViewStoreOf<Counter>) {
        self.viewStore = viewStore
        
        super.init(frame: .zero)
        
        setLayout()
        setConstraint()
        setAttribute()
        setBind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(label)
    }
    
    private func setConstraint() {
        minusButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(40)
            $0.centerY.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.centerY.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setAttribute() {
        backgroundColor = .systemBackground
    }
    
    private func setBind() {
        plusButton.tapPublisher.sink { [unowned self] in
            viewStore.send(.incrementButtonTapped)
        }
        .store(in: &cancellables)
        
        minusButton.tapPublisher.sink { [unowned self] in
            viewStore.send(.decrementButtonTapped)
        }
        .store(in: &cancellables)
        
        viewStore.publisher
            .map { "\($0.count)" }
            .assign(to: \.label.text, on: self)
            .store(in: &cancellables)
    }
}
