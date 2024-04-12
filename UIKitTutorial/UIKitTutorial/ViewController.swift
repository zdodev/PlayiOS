import UIKit

final class MainViewController: UIViewController {
    enum Section {
        case main
    }
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout.list(using: .init(appearance: .plain))
    )
    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setLayout()
        setConstraints()
        configureViews()
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
    }
    
    private func configureViews() {
        collectionView.delegate = self
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { cell, indexPath, item in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item)"
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0...100))
        dataSource.apply(snapshot)
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

#Preview {
    MainViewController()
}
