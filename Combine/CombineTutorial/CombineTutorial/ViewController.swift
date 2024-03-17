import UIKit
import Combine
import SnapKit
import CombineUIKit

final class ViewController: UIViewController {
    private let control = UIControl()
    private let testButton = UIButton(configuration: .filled())
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(control)
        contentView.backgroundColor = .systemRed
        
        control.backgroundColor = .systemBlue
        control.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.center.equalToSuperview()
        }
        control.publisher.tap
            .sink { [weak self] in
                let viewController = SecondController()
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
            .store(in: &cancellables)
        
//        scrollView.snp.makeConstraints {
//            $0.directionalEdges.equalTo(view)
//        }
//
//        scrollView.combine.scrollViewDidScroll
//            .sink { scrollView in
//                print(scrollView.contentOffset)
//            }
//            .store(in: &cancellables)
    }
}
