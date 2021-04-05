import UIKit

final class MainViewController: UIViewController {
    private enum Section {
        case main
    }
    
    private var todoCollectionView: UICollectionView! = nil
    
    private let item = [
        Item(title: "나는 최고다."),
        Item(title: "너는 최고다."),
        Item(title: "우리는 최고다."),
        Item(title: "zdo"),
        Item(title: "😎"),
    ]
    
    // Providing the Collection View Data
    // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureTodoCollectionView()
        configureDataSourece()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Project Manager"
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .add), animated: true)
    }
    
    // 레이아웃 생성
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    private func configureTodoCollectionView() {
        todoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(todoCollectionView)
        
        todoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            todoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
            todoCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            todoCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func configureDataSourece() {
        // Creating Cells
        // 컬렉션 뷰에 셀 등록
        let cellRegistration = UICollectionView.CellRegistration<MemoCell, Item> { (cell, indexPath, item) in
            cell.updateWithItem(item)
        }
        
        // Providing the Collection View Data
        // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: todoCollectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        // Data
        // 특정 시점의 뷰에서 데이터 상태를 나타냅니다.
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(item, toSection: .main)
        dataSource.apply(snapshot)
    }
}

private struct Item: Hashable {
    let title: String?
}

private class MemoCell: UICollectionViewListCell {
    private var item: Item!
    private var title = UILabel()
    
    func updateWithItem(_ newItem: Item) {
        item = newItem
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        setupUI()
        title.text = item.title
    }
    
    private func setupUI() {
        contentView.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
