import UIKit
import RxSwift

final class ViewController: UIViewController {
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    private let viewModel = TransformViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    private func bind() {
        let input = TransformViewModel.Input(decreaseAction: decreaseButton.rx.tap, increaseAction: increaseButton.rx.tap)
        let output = viewModel.transform(input: input)
        
        output.countedValue
            .map { String($0) }
            .drive(numberLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

