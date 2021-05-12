import UIKit

final class ViewController: UIViewController {
    // 수평 스택 뷰
    private let horizontalStackView = UIStackView()
    private var horizontalViews = [UIView]()
    // 수직 스택 뷰
    private let verticalStackView = UIStackView()
    private var verticalViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(horizontalStackView)
        view.addSubview(verticalStackView)
        configureStackViewAppearance()
        addViews()
        addArrangedSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        configureStackViewFrame()
    }
    
    // 프레임 기반 레이아웃 설정
    private func configureStackViewFrame() {
        // 수평 스택 뷰 레이아웃
        let horizontalX = view.safeAreaInsets.left + 8
        let horizontalY = view.safeAreaInsets.top + 8
        let horizontalWidth = view.frame.size.width - view.safeAreaInsets.right - view.safeAreaInsets.left - 16
        let horizontalHeight = view.frame.size.height / 3
        horizontalStackView.frame = CGRect(x: horizontalX, y: CGFloat(horizontalY), width: horizontalWidth, height: horizontalHeight)
        
        // 수직 스택 뷰 레이아웃
        let verticalX = horizontalX
        let verticalY = horizontalY + horizontalHeight + 10
        let verticalWidth = horizontalWidth
        let verticalHeight = horizontalHeight
        verticalStackView.frame = CGRect(x: verticalX, y: verticalY, width: verticalWidth, height: verticalHeight)
    }
    
    // 스택 뷰 화면 설정
    private func configureStackViewAppearance() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 10
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
    }
    
    // 스택뷰에 뷰 추가
    private func addArrangedSubviews() {
        horizontalViews.forEach { view in
            horizontalStackView.addArrangedSubview(view)
        }
        verticalViews.forEach { view in
            verticalStackView.addArrangedSubview(view)
        }
    }
    
    // 스택 뷰에 추가할 뷰 생성
    private func addViews() {
        let horizontalColors: [UIColor] = [.systemTeal, .systemGray, .systemPink, .systemBlue]
        horizontalViews = horizontalColors.map { color in
            let view = UIView()
            view.backgroundColor = color
            return view
        }
        
        let verticalColors: [UIColor] = [.systemOrange, .systemYellow, .systemPurple]
        verticalViews = verticalColors.map { color in
            let view = UIView()
            view.backgroundColor = color
            return view
        }
    }
}

