import UIKit

final class MainViewController: UIViewController {
    private let mainView: MainView
    
    private let topViewController = TopViewController()
    private let bottomViewController = BottomViewController()
    
    init() {
        mainView = .init(
            topView: topViewController.view,
            bottomView: bottomViewController.view
        )
        
        super.init(nibName: nil, bundle: nil)
        
        addChild(topViewController)
        topViewController.didMove(toParent: self)
        addChild(bottomViewController)
        bottomViewController.didMove(toParent: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        
    }
    
    final class MainView: UIView {
        private let topView: UIView
        private let bottomView: UIView
        
        init(topView: UIView, bottomView: UIView) {
            self.topView = topView
            self.bottomView = bottomView
            
            super.init(frame: .zero)
            
            addSubview(topView)
            addSubview(bottomView)
            
            topView.snp.makeConstraints {
                $0.top.directionalHorizontalEdges.equalToSuperview()
                $0.height.equalToSuperview().multipliedBy(0.5)
            }
            
            bottomView.snp.makeConstraints {
                $0.top.equalTo(topView.snp.bottom)
                $0.directionalHorizontalEdges.bottom.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}



#Preview {
    MainViewController()
}
