import UIKit

class ViewController: UIViewController {
    private let item = [
        Item(name: "list", address: "cell"),
        Item(name: "cell", address: "list"),
        Item(name: "joe", address: "mmo"),
        Item(name: "tea", address: "hong"),
        Item(name: "coffee", address: "americano"),
        Item(name: "zdo", address: "dev"),
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
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        setupViewsIfNeeded()
        
        var content = defaultListContentConfiguration()
        content.text = item?.name
        content.secondaryText = item?.address
        listContentView.configuration = content
    }
    
    private func setupViewsIfNeeded() {
        contentView.addSubview(listContentView)
        
        listContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            listContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            listContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

