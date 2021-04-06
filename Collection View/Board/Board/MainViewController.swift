import UIKit

// 메인 뷰 컨트롤러
final class MainViewController: UIViewController {
    // 컬렉션 뷰 섹션
    private enum Section {
        case main
    }
    
    private var todoCollectionView: UICollectionView! = nil
    private var doingCollectionView: UICollectionView! = nil
    private var doneCollectionView: UICollectionView! = nil
    
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
    
    // Providing the Collection View Data
    // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
    private var todoDataSource: UICollectionViewDiffableDataSource<HeaderItem, Item>!
//    private var todoDataSource = UICollectionViewDiffableDataSource<HeaderItem, Item>()
//    private var doingDataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
//    private var doneDataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureCollectionView()
        configureDataSourece()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Project Manager"
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: .add), animated: true)
    }
    
    // 레이아웃 생성
    private func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.headerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    private func configureCollectionView() {
        todoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(todoCollectionView)
        
        todoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            todoCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            todoCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            todoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            todoCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])
        
        doingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(doingCollectionView)
        doingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doingCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            doingCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            doingCollectionView.leadingAnchor.constraint(equalTo: todoCollectionView.trailingAnchor),
            doingCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
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
    
    private func configureDataSourece() {
        // Creating Cells
        // 컬렉션 뷰에 셀 등록
        let cellRegistration = UICollectionView.CellRegistration<MemoCell, Item> { (cell, indexPath, item) in
            cell.updateWithItem(item)
        }
        
        let headerCellRegistration = UICollectionView.SupplementaryRegistration<MemoHeaderCell>(elementKind: "Header") { (supplementaryView, string, indexPath) in
//            supplementaryView.titleLabel.text = "ff"
//            supplementaryView.backgroundColor = .red
//            supplementaryView
        }
        
        // Providing the Collection View Data
        // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
        todoDataSource = UICollectionViewDiffableDataSource<HeaderItem, Item>(collectionView: todoCollectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
        todoDataSource.supplementaryViewProvider = { [unowned self] supplementaryView, elementKind, indexPath -> UICollectionReusableView? in 
            self.todoCollectionView.dequeueConfiguredReusableSupplementary(using: headerCellRegistration, for: indexPath)
        }
    
        
//        doingDataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: doingCollectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
//            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
//        })
//        
//        doneDataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: doneCollectionView, cellProvider: { (collectioView, indexPath, item) -> UICollectionViewCell? in
//            collectioView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
//        })
        
        // Data
        // 특정 시점의 뷰에서 데이터 상태를 나타냅니다.
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.main])
//
//        var headerSnapshot = NSDiffableDataSourceSectionSnapshot<HeaderItem>()
//        headerSnapshot.append(headerItem)
//        //        todoDataSource.apply
//
//        snapshot.appendItems(item, toSection: .main)
//        todoDataSource.apply(snapshot)
//        doingDataSource.apply(snapshot)
//        doneDataSource.apply(snapshot)
        
        var snapshot = NSDiffableDataSourceSnapshot<HeaderItem, Item>()
        snapshot.appendSections(headerItem)
        
        for headerItem in headerItem {
            snapshot.appendItems(headerItem.items, toSection: headerItem)
        }
        
        todoDataSource.apply(snapshot)
    }
}

private struct Item: Hashable {
    let title: String
    let description: String
    let date: String
}

private struct HeaderItem: Hashable {
    let title: String
    let items: [Item]
}

private class MemoCell: UICollectionViewListCell {
    private var item: Item!
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let dateLabel = UILabel()
    
    func updateWithItem(_ newItem: Item) {
        item = newItem
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        setupConstraints()
        setupUI()
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupUI() {
        titleLabel.text = item.title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.text = item.description
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 3
        
        dateLabel.text = item.date
    }
}

private class MemoHeaderCell: UICollectionReusableView {
    let titleLabel = UILabel()
    let viewview = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewview.backgroundColor = .red
        
        addSubview(viewview)
        viewview.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "살려줘"
        titleLabel.backgroundColor = .brown
        
        let layout = viewview.heightAnchor.constraint(equalToConstant: 100)
        layout.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            viewview.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            viewview.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            viewview.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            layout,
//            viewview.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
//            viewview.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: viewview.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
