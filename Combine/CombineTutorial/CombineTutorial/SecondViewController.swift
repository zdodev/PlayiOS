import UIKit
import Combine
import SnapKit
import CombineUIKit

final class SecondController: UIViewController {
    private let control = UIControl()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tertiarySystemBackground
        
        control.combine.publisher(.touchUpInside)
            .sink {
                print("tap control")
            }
            .store(in: &cancellables)
 
        view.addSubview(control)
        
        control.backgroundColor = .systemOrange
        control.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.center.equalToSuperview()
        }
    }
}
