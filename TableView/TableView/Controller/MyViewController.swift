import UIKit

final class MyViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let dataSource = TableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        configureTableView()
        configurateTableViewLayout()
    }
    
    private func configureTableView() {
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = dataSource
    }
    
    private func configurateTableViewLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }
}
