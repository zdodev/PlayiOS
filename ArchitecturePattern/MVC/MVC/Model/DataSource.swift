import UIKit

// 테이블 뷰의 데이터 소스 정의
class DataSource: NSObject, UITableViewDataSource {
    // 데이터 소스 내 모델 데이터 포함
    var data = [Item]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.setText(data[indexPath.row].text)
        return cell
    }
}
