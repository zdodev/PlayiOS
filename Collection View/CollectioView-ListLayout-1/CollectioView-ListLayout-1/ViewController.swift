import UIKit

class ViewController: UIViewController {
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        getUsers()
    }
    
    func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, User> {
            cell, indexPath, user in
            var content = cell.defaultContentConfiguration()
            content.text = user.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: collectionView) {
            collectionView, indexPath, user in
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: user)
        }
    }
    
    func getUsers() {
        NetworkingService.requestUsers { [weak self] result in
            switch result {
            case .success(let users):
                print(users)
                self?.populate(with: users)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func populate(with users: [User]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, User>()
        snapshot.appendSections([.main])
        snapshot.appendItems(users)
        dataSource?.apply(snapshot)
    }
}

extension ViewController {
    enum Section {
        case main
    }
}
