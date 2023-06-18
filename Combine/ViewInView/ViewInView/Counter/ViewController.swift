import UIKit
import Combine
import SnapKit
import Then
import CombineCocoa

final class ViewController: UIViewController {
    private let counterView: CounterView
    
    private let viewModel = CounterViewModel()
    private var anyCancellables = Set<AnyCancellable>()
    
    init() {
        counterView = CounterView(count: viewModel.$count.eraseToAnyPublisher())
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        counterView = CounterView(count: viewModel.$count.eraseToAnyPublisher())
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(counterView)
        
        counterView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        
        counterView.plusButton.tapPublisher
            .sink { [unowned self] in
                viewModel.increaseCount()
            }
            .store(in: &anyCancellables)
        
        counterView.minusButton.tapPublisher
            .sink { [unowned self] in
                viewModel.decreaseCount()
            }
            .store(in: &anyCancellables)
    }
}
