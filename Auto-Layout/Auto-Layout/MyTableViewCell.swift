import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
    }
}
