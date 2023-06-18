import UIKit
import Combine
import SnapKit
import Then

/*
 CounterView
 PlusButton
 MinusButton
 CountLabel
 */
final class CounterView: UIView {
    let minusButton = UIButton(type: .system).then {
        $0.setImage(
            UIImage(systemName: "minus"),
            for: .normal
        )
    }
    let plusButton = UIButton(type: .system).then {
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
    
    private let count: AnyPublisher<Count, Never>
    
    private var anyCancellables = Set<AnyCancellable>()
    
    init(count: AnyPublisher<Count, Never>) {
        self.count = count
        
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
        count
            .map { "\($0.count)" }
            .assign(to: \.label.text, on: self)
            .store(in: &anyCancellables)
    }
}
