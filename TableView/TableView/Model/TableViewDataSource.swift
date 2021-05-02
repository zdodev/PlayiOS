import UIKit

final class TableViewDataSource: NSObject, UITableViewDataSource {
    let data = [
        TextList(Title: "title1", description: "description"),
        TextList(Title: "title2", description: "description"),
        TextList(Title: "title3", description: "description"),
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyTableViewCell {
            cell.configureCell(data: data[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}
