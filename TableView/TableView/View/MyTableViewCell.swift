import UIKit

class MyTableViewCell: UITableViewCell {
    func configureCell(data: TextList) {
        textLabel?.text = data.Title
    }
}
