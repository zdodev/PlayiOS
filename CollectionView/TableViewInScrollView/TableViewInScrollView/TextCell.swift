import UIKit
import SnapKit
import Then

final class TextCell: UICollectionViewCell {
    static let identifier = "TextCell"
    
    private let textLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(textLabel)
        contentView.backgroundColor = .lightGray
        
        textLabel.snp.makeConstraints {
            $0.directionalVerticalEdges.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(text: String) {
        textLabel.text = text
    }
}
