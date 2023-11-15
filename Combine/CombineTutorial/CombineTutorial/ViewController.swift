import UIKit
import Combine
import SnapKit
import CombineUIKit

final class ViewController: UIViewController {
    private let control = UIControl()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.addSubview(control)
        
        control.backgroundColor = .systemBlue
        control.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.center.equalToSuperview()
        }
        control.controlEventPublisher(for: .touchUpInside).sink {
            print("tap control")
        }
        .store(in: &cancellables)
    }
}
