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
    private let timerButton = UIButton(type: .system).then {
        $0.setTitleColor(
            .systemBlue,
            for: .normal
        )
    }
    private let factButton = UIButton(type: .system).then {
        $0.setTitle(
            "Fact",
            for: .normal
        )
        $0.setTitleColor(
            .systemBlue,
            for: .normal
        )
    }
    private let countLabel = UILabel().then {
        $0.font = .systemFont(
            ofSize: 18,
            weight: .black
        )
    }
    private let descriptionLabel = UILabel().then {
        $0.font = .systemFont(
            ofSize: 18,
            weight: .black
        )
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private let activityIndicatorView = UIActivityIndicatorView()
    
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
        addSubview(timerButton)
        addSubview(factButton)
        addSubview(countLabel)
        addSubview(descriptionLabel)
        addSubview(activityIndicatorView)
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
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        timerButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(countLabel.snp.bottom).offset(20)
        }
        
        factButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(timerButton.snp.bottom).offset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(factButton.snp.bottom).offset(20)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        
        activityIndicatorView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(factButton.snp.bottom).offset(20)
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
        
        timerButton.tapPublisher.sink { [unowned self] in
            viewStore.send(.toggleTimerButtonTapped)
        }
        .store(in: &cancellables)
        
        factButton.tapPublisher.sink { [unowned self] in
            viewStore.send(.factButtonTapped)
        }
        .store(in: &cancellables)
        
        viewStore.publisher
            .map { "\($0.count)" }
            .assign(to: \.countLabel.text, on: self)
            .store(in: &cancellables)
        
        viewStore.publisher.fact
            .assign(to: \.descriptionLabel.text, on: self)
            .store(in: &cancellables)
        
        viewStore.publisher.isTimerRunning
            .map { $0 ? "Stop timer" : "Start timer" }
            .sink { [unowned self] in
                timerButton.setTitle($0, for: .normal)
            }
            .store(in: &cancellables)
        
        viewStore.publisher.isLoading
            .sink { [unowned self] in
                if $0 {
                    activityIndicatorView.startAnimating()
                    return
                }
                activityIndicatorView.stopAnimating()
            }
            .store(in: &cancellables)
    }
}
