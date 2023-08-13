import UIKit
import SnapKit
import Then

final class ContentScrollView: UIScrollView {
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayouts()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        addSubview(contentView)
    }
    
    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.directionalEdges.equalTo(contentLayoutGuide)
            $0.width.equalTo(frameLayoutGuide)
        }
    }
}
