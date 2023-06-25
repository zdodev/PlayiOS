import UIKit
import Combine

import CombineCocoa
import ComposableArchitecture

final class CounterViewController: UIViewController {
    private lazy var counterView = CounterView(viewStore: viewStore)
    
    private let viewStore: ViewStoreOf<Counter>
    private var anyCancellables = Set<AnyCancellable>()
    
    init(viewStore: ViewStoreOf<Counter>) {
        self.viewStore = viewStore
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                              
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(counterView)
        
        counterView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
