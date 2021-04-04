import UIKit

class MainViewController: UIViewController {
    private var todoCollectionView: UICollectionView! = nil
    
    enum Section {
        case main
        case sub
    }
    
    private struct Item: Hashable {
        let title: String?
    }
    
    // Providing the Collection View Data
    // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
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
//        return UICollectionViewCompositionalLayout { section, layoutEnvironment in
//            // Creating a List Layout
//            // 리스트 레이아웃을 만들기 위한 구성입니다.
//            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//            // 사용할 헤더 타입에 대한 정보입니다.
//            config.headerMode = .firstItemInSection
//            // Creating a List Layout
//            // 지정된 구성의 리스트 섹션만 포함하는 컴포지션 레이아웃을 만듭니다.
////                    return UICollectionViewCompositionalLayout.list(using: config)
////            return NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
//            
//        }
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
        let headerRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item)"
            cell.contentConfiguration = content
            cell.accessories = [.outlineDisclosure()]
        }
        
        // Creating Cells
        // 컬렉션 뷰에 셀 등록
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "\(item)"
            cell.contentConfiguration = content
        }
        
        // Providing the Collection View Data
        // 데이터를 관리하고 컬렉션 뷰에 셀을 제공하는데 사용합니다.
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: todoCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            if indexPath.item == 0 {
                return collectionView.dequeueConfiguredReusableCell(using: headerRegistration, for: indexPath, item: identifier)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
            }
        }
        
        // Data
        // 특정 시점의 뷰에서 데이터 상태를 나타냅니다.
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main, .sub])
        snapshot.appendItems([100], toSection: .main)
        snapshot.appendItems(Array(0..<50), toSection: .main)
//        snapshot.appendItems(Array(100..<200), toSection: .sub)
        dataSource.apply(snapshot)
        
    }
}
