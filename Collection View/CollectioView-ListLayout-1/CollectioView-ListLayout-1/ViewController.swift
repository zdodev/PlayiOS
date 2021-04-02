import UIKit

class ViewController: UIViewController {
    let mainView = MainView()
    var dataSource: UICollectionViewDiffableDataSource<Section, User>?
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        getUsers()
    }
    
    func setupCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, User> {
            cell, indexPath, user in
            var content = cell.defaultContentConfiguration()
            content.text = user.name
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: mainView.collectionView) {
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
