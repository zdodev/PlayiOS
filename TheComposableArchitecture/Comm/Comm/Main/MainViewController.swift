import UIKit
import SwiftUI
import Combine
import ComposableArchitecture
import SnapKit
import Then

final class MainViewController: UIViewController {
    private let countLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
    }
    private let nextButton = UIButton(type: .system).then {
        $0.setTitle(
            "next",
            for: .normal
        )
    }
    
    private let store: StoreOf<MainDomain>
    private let viewStore: ViewStoreOf<MainDomain>
    private var anyCancellables = Set<AnyCancellable>()
    
    init(store: StoreOf<MainDomain>) {
        self.store = store
        viewStore = ViewStore(store) {
            $0
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(countLabel)
        view.addSubview(nextButton)
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(1.5)
        }
        
        viewStore.publisher
            .map { "\($0.count.number)" }
            .assign(to: \.countLabel.text, on: self)
            .store(in: &anyCancellables)
        
        nextButton.tapPublisher.sink { [unowned self] in
            let countViewController = CountViewController(store: store.scope(state: \.count) {
                .count($0)
            })
            navigationController?.pushViewController(countViewController, animated: true)
        }
        .store(in: &anyCancellables)
    }
}

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewController(store: Store(initialState: MainDomain.State()) {
            MainDomain()
        }).preview
    }
}
