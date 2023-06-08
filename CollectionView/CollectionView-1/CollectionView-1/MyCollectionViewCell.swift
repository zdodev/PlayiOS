import UIKit

// 컬렉션 뷰 표시 범위 내에 있는 단일 데이터 항목입니다.
class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    // Instance Methods
    // 인터페이스 빌더 또는 nib 파일에서 로드된 후 서비스를 위해 receiver를 준비한다?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        // 인터페이스 빌더 nib 파일을 래핑하거나 포함하는 객체입니다.
        UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
