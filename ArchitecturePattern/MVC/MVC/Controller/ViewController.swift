import UIKit

// 컨트롤러 정의
class ViewController: UIViewController {
    // 뷰 선언
    private let tableView = MyTableView(frame: .zero, style: .insetGrouped)
    // 데이터 소스 선언
    private let dataSource = DataSource()
    // 데이터 정의
    private let data = [
        Item(text: "MVC일까요?"),
        Item(text: "MVP일까요?"),
        Item(text: "MVVM일까요?"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // 뷰 레이아웃 설정
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    // 뷰 설정
    private func setupUI() {
        // 컨트롤러의 뷰 설정
        let barButtonItem = UIBarButtonItem(systemItem: .add)
        barButtonItem.target = self
        barButtonItem.action = #selector(updateDataSource)
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "MVC"
        
        // 테이블 뷰 설정
        view.addSubview(tableView)
        tableView.dataSource = dataSource
    }
    
    // 터치 이벤트 시 데이터 소스에 데이터를 추가하고 테이블 뷰 리로드
    @objc private func updateDataSource() {
        dataSource.data.append(data.randomElement()!)
        tableView.reloadData()
    }
}
