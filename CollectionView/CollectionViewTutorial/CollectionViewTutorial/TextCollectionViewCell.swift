import UIKit
import SnapKit

final class TextCollectionViewCell: UICollectionViewCell {
    static let identifier = "TextCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBlue
        
        configureLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(text: String) {
        label.text = text
    }
    
    private func configureLayouts() {
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
