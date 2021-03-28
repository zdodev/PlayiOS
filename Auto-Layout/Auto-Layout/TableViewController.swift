import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
        "나는 최고다.",
        "너도 최고다.",
        "우리도 최고다.",
        "😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎",
        "전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작",
        "나는 최고다.",
        "너도 최고다.",
        "우리도 최고다.",
        "😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎",
        "전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작",
        "나는 최고다.",
        "너도 최고다.",
        "우리도 최고다.",
        "😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎",
        "전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작",
        "나는 최고다.",
        "너도 최고다.",
        "우리도 최고다.",
        "😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎😎",
        "전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작전설의 시작",
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "MyTableViewCell")
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 120
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.userContent.text = contentArray[indexPath.row]
        print(indexPath)
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    
}
