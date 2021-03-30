import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        // Configuring a View's Visual Appearance
        // 하위뷰가 뷰의 경계로 제한되는지 여부를 결정합니다.
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Managing the Content
        // 셀의 커스텀 콘텐츠를 추가하는 메인 뷰입니다.
        contentView.addSubview(imageView)
        
        let images = [
            UIImage(named: "bird"),
            UIImage(named: "bird"),
            UIImage(named: "bird"),
            UIImage(named: "bird"),
            UIImage(named: "bird"),
            UIImage(named: "bird")
        ].compactMap {
            $0
        }
        
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Laying out Subsivew
    // 하위 뷰를 배치합니다.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = contentView.bounds
    }
    
    // Reusing Cells
    // 재사용할 뷰를 준비하는데 필요한 정리를 수행합니다.
    override func prepareForReuse() {
        super.prepareForReuse()
        
//        imageView.image = nil
    }
}
