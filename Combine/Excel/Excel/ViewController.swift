import UIKit
import Combine
import CombineCocoa

class ViewController: UIViewController {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    
    private let viewModel = ViewModel()
    private var anyCancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.trasform(
            firstPublisher: firstTextField.textPublisher,
            secondPublisher: secondTextField.textPublisher
        )
        
        viewModel.$firstLabel
            .map { "\($0)" }
            .assign(to: \.text, on: FirstLabel)
            .store(in: &anyCancellables)
        
        viewModel.$secondLabel
            .map { "\($0)" }
            .assign(to: \.text, on: SecondLabel)
            .store(in: &anyCancellables)
    }
}

final class ViewModel {
    @Published var firstLabel = 0
    @Published var secondLabel = 0
    
    private var anyCancellables = Set<AnyCancellable>()
    
    func trasform(firstPublisher: AnyPublisher<String?, Never>, secondPublisher: AnyPublisher<String?, Never>) {
        
        let first = firstPublisher
            .compactMap { $0 }
            .compactMap { $0.isEmpty ? 0 : Int($0) }
        
        let second = secondPublisher
            .compactMap { $0 }
            .compactMap { $0.isEmpty ? 0 : Int($0) }
        Publishers.CombineLatest(first, second)
            .map { $0 + $1 }
            .assign(to: \.firstLabel, on: self)
            .store(in: &anyCancellables)
        
        Publishers.CombineLatest($firstLabel, $firstLabel)
            .map { $0 + $1 }
            .assign(to: \.secondLabel, on: self)
            .store(in: &anyCancellables)
    }
}
