import UIKit
import Combine
import SnapKit
import CombineUIKit
//import CombineCocoa

final class SecondController: UIViewController {
    private let scrollView = UITextView()
    private let contentView = UIView()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
//        contentView.backgroundColor = .systemBlue
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints {
//            $0.directionalEdges.equalTo(scrollView.contentLayoutGuide)
//            $0.width.equalTo(scrollView.frameLayoutGuide)
//            $0.height.equalTo(2000)
//        }
        
        scrollView.publisher.scrollViewDidScroll
            .sink { scrollView in
                print(scrollView.contentOffset)
            }
            .store(in: &cancellables)
        
        scrollView.publisher.scrollViewWillBeginDragging
            .sink { s in
                print("scrollViewWillBeginDragging")
            }
            .store(in: &cancellables)
        
        scrollView.publisher.textViewDidBeginEditing
            .sink { v in
                print(v.text)
            }
            .store(in: &cancellables)
    }
}
