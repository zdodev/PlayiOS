import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setImage() {
        imageView.image = UIImage(systemName: "pencil")
    }
}
