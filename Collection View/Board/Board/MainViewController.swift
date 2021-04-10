import UIKit

// 메인 뷰 컨트롤러
final class MainViewController: UIViewController {
    private var todoCollectionView: UICollectionView!
    private var doingCollectionView: UICollectionView!
    private var doneCollectionView: UICollectionView!
    
    // Providing the Collection View Data
    // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
    private var todoDataSource: UICollectionViewDiffableDataSource<HeaderItem, Item>!
    private var doingDataSource: UICollectionViewDiffableDataSource<HeaderItem, Item>!
    private var doneDataSource: UICollectionViewDiffableDataSource<HeaderItem, Item>!
    
    private let item = [
        Item(title: "나는 최고다.", description: "정말 최고다.", date: "2021-01-01"),
        Item(title: "너는 최고다.", description: "너무 최고다.", date: "2021-01-01"),
        Item(title: "우리는 최고다.", description: "진짜 최고다.", date: "2021-01-01"),
        Item(title: "zdo", description: "3%", date: "2021-01-01"),
        Item(title: "😎", description: "전설의 시작", date: "2021-01-01"),
    ]
    
    private let headerItem = [
        HeaderItem(title: "todo", items: [
            Item(title: "나는 최고다.", description: "정말 최고다.", date: "2021-01-01"),
            Item(title: "너는 최고다.", description: "너무 최고다.", date: "2021-01-01"),
            Item(title: "우리는 최고다.", description: "진짜 최고다.", date: "2021-01-01"),
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureCollectionView()
        configureDataSource()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Project Manager"
        
        let barButtonItem = UIBarButtonItem(systemItem: .add)
        barButtonItem.target = self
        barButtonItem.action = #selector(showMemoInsertView)
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    @objc private func showMemoInsertView() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemRed
        present(viewController, animated: true)
    }
}

// Collecion View 생성
extension MainViewController {
    // 레이아웃 생성
    private func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.headerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    // 컬렉션 뷰 생성
    private func configureCollectionView() {
        todoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(todoCollectionView)
        
        todoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            todoCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            todoCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            todoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3),
        ])
        
        doingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(doingCollectionView)
        doingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doingCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            doingCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            doingCollectionView.leadingAnchor.constraint(equalTo: todoCollectionView.trailingAnchor),
            doingCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3),
        ])
        
        doneCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(doneCollectionView)
        doneCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            doneCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            doneCollectionView.leadingAnchor.constraint(equalTo: doingCollectionView.trailingAnchor),
            doneCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// Data
extension MainViewController {
    private func configureDataSource() {
        // Creating Cells
        let cellRegistration = UICollectionView.CellRegistration<MemoCell, Item> { (cell, indexPath, item) in
            cell.updateWithItem(item)
        }
        
        // Creating Headers and Footers
        // A registration for collection view's supplementary views.
        let headerCellRegistration = UICollectionView.SupplementaryRegistration<MemoHeaderCell>(elementKind: "Header") { (supplementaryView, string, indexPath) in
            supplementaryView.updateWithHeaderItem("TODO", 5)
        }
        
        // if else, switch 같이 분기를 태우는게 좋을까?
        // 타입을 늘리는게 좋을까?
        
        // Providing the Collection View Data
        // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
        todoDataSource = UICollectionViewDiffableDataSource<HeaderItem, Item>(collectionView: todoCollectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        todoDataSource.supplementaryViewProvider = { (supplementaryView, elementKind, indexPath) in
            self.todoCollectionView.dequeueConfiguredReusableSupplementary(using: headerCellRegistration, for: indexPath)
        }
        
        
        doingDataSource = UICollectionViewDiffableDataSource<HeaderItem, Item>(collectionView: doingCollectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        })
        
        doingDataSource.supplementaryViewProvider = { (supplementaryView, elementKind, indexPath) in
            self.todoCollectionView.dequeueConfiguredReusableSupplementary(using: headerCellRegistration, for: indexPath)
        }
        
        doneDataSource = UICollectionViewDiffableDataSource<HeaderItem, Item>(collectionView: doneCollectionView, cellProvider: { (collectioView, indexPath, item) -> UICollectionViewCell? in
            collectioView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        })
        
        doneDataSource.supplementaryViewProvider = { (supplementaryView, elementKind, indexPath) in
            self.todoCollectionView.dequeueConfiguredReusableSupplementary(using: headerCellRegistration, for: indexPath)
        }
        
        // Data
        // 특정 시점의 뷰에서 데이터 상태를 나타냅니다.
        var snapshot = NSDiffableDataSourceSnapshot<HeaderItem, Item>()
        snapshot.appendSections(headerItem)
        
        for headerItem in headerItem {
            snapshot.appendItems(headerItem.items, toSection: headerItem)
        }
        
        todoDataSource.apply(snapshot)
        doingDataSource.apply(snapshot)
        doneDataSource.apply(snapshot)
    }
    
}
