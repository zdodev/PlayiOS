import UIKit
import Combine
import SnapKit
import CombineUIKit

final class SecondController: UIViewController {
    private let scrollView = CombineScrollView()
    
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        scrollView.publisher.scrollViewDidScroll
            .sink { v in
                print(v.contentOffset)
            }
            .store(in: &cancellables)
    }
}
