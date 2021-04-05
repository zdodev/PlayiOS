import UIKit

class ViewController: UIViewController {
    private let item = [
        Item(name: "list", address: "cell", date: "2020-01-01"),
        Item(name: "cell", address: "list", date: "2020-01-01"),
        Item(name: "joe", address: "mmo", date: "2020-01-01"),
    ]
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationCollectionView()
        configurationDataSource()
    }
    
    private func configurationCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    private func configurationDataSource() {
        // CellRegistration
        let cellRegistration = UICollectionView.CellRegistration<MyCell, Item> { (cell, indexPath, item) in
            cell.updateWithItem(item)
        }
        
        // DataSource
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        })
        
        // Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(item)
        dataSource.apply(snapshot)
    }
}

private enum Section {
    case main
}

private struct Item: Hashable {
    let name: String
    let address: String
    let date: String
}

private class MyCell: UICollectionViewListCell {
    private var item: Item?
    
    func updateWithItem(_ newItem: Item) {
        guard item != newItem else {
            return
        }
        item = newItem
    }
    
    private func defaultListContentConfiguration() -> UIListContentConfiguration {
        .subtitleCell()
    }
    
    private lazy var listContentView = UIListContentView(configuration: defaultListContentConfiguration())
    private lazy var date = UILabel(frame: .zero)
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        setupViewsIfNeeded()
        
        var content = defaultListContentConfiguration()
        content.text = item?.name
        content.secondaryText = item?.address
        listContentView.configuration = content
        date.text = item?.date
    }
    
    private func setupViewsIfNeeded() {
        contentView.addSubview(listContentView)
        contentView.addSubview(date)
        
        listContentView.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            listContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            date.topAnchor.constraint(equalTo: listContentView.bottomAnchor),
            date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            date.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

