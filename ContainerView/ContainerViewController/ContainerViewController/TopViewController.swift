import UIKit

final class TopViewController: UIViewController {
    private let mainView = TopView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        
        print(#function)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        print(#function)
    }
}

final class TopView: UIView {
    private let nameLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(nameLabel)
        backgroundColor = .systemRed
        
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nameLabel.text = "top"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    TopViewController()
}
