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
        
        // UICollectionView.CellRegistration 생성
        // 셀은 UICollectionViewListCell
        // Configuration은 defaultContentConfiguration
        // 모델은 User
        // CellRegistration에서는
        let registration = UICollectionView.CellRegistration<MyCell, User> {
            cell, indexPath, user in
            // 디폴트 configuration
            var content = cell.defaultContentConfiguration()
            content.text = user.name
            content.secondaryText = "까꿍"
            content.image = UIImage(named: "bird")
            content.imageProperties.maximumSize = CGSize(width: 30, height: 50)
            cell.accessories = [.disclosureIndicator()]
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

class MyCell: UICollectionViewListCell {
    var named: String? = nil
    
    func update(_ name: String) {
        named = name
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        var newContentConfiguration = defaultContentConfiguration()
        newContentConfiguration.text = "짜잔"
        contentConfiguration = newContentConfiguration
    }
}
