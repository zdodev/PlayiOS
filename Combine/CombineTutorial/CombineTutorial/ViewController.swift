import UIKit
import Combine
import SnapKit
import CombineUIKit

final class ViewController: UIViewController {
    private let control = UIControl()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(control)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .systemRed
        
//        control.backgroundColor = .systemBlue
//        control.snp.makeConstraints {
//            $0.size.equalTo(50)
//            $0.center.equalToSuperview()
//        }
        
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view)
        }
        contentView.snp.makeConstraints {
            $0.directionalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1000)
        }
        
        scrollView.combine.contentOffset
            .sink { offset in
                print(offset)
            }
            .store(in: &cancellables)
    }
}
