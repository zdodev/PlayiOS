import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {
    private let countLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .label
        $0.text = "ff"
    }
    private let decreaseButton = UIButton().then {
        $0.setTitle("decrease", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    private let increaseButton = UIButton().then {
        $0.setTitle("increase", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    private let viewModel = CounterViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countLabel)
        view.addSubview(decreaseButton)
        view.addSubview(increaseButton)
        
        countLabel.snp.makeConstraints {
            $0.center.equalTo(view)
        }
        decreaseButton.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.trailing.equalTo(countLabel.snp.leading).offset(-20)
        }
        increaseButton.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.leading.equalTo(countLabel.snp.trailing).offset(20)
        }
        
        let input = CounterViewModel.Input(
            increaseButtonTap: increaseButton.rx.tap,
            decreaseButtonTap: decreaseButton.rx.tap
        )
        
        let output = viewModel.transform(input: input)
        output.countNumber
            .map {
                "\($0)"
            }
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

