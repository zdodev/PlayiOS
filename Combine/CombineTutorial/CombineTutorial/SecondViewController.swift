import UIKit
import Combine
import SnapKit
import CombineUIKit
//import CombineCocoa

final class SecondController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        contentView.backgroundColor = .systemBlue
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.directionalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(2000)
        }
        
//        scrollView.publisher.scrollViewDidScroll
//            .sink { v in
//                print(v.contentOffset)
//            }
//            .store(in: &cancellables)
//        scrollView.willBeginDraggingPublisher
//            .sink {
//                print("drag")
//            }
//            .store(in: &cancellables)
    }
}
