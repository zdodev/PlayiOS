import UIKit
import SnapKit
import Then
import Combine

class ViewController: UIViewController {
    enum Section {
        case main
    }
    
    private let redView = UIView().then {
        $0.backgroundColor = .systemRed
    }
    private let blueView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    private let scrollView = ContentScrollView()
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    ).then {
        $0.isScrollEnabled = false
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, Int>!
    var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        scrollView.contentView.addSubview(collectionView)
        scrollView.contentView.addSubview(redView)
        scrollView.contentView.addSubview(blueView)
        
        redView.snp.makeConstraints {
            $0.top.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        blueView.snp.makeConstraints {
            $0.bottom.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.identifier)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalTo(blueView.snp.top)
        }

        collectionViewDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as? TextCell else {
                return UICollectionViewCell()
            }
            cell.setContent(text: "\(itemIdentifier)")
            return cell
        })
        collectionView.dataSource = collectionViewDataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(99990...100040))
        collectionViewDataSource.apply(snapshot)
        
        collectionView.contentSizePublisher
            .sink { [unowned self] size in
                print(size.height)
                if size.height > 0 {
                    collectionView.snp.updateConstraints {
                        $0.top.equalTo(redView.snp.bottom)
                        $0.directionalHorizontalEdges.equalToSuperview()
                        $0.height.equalTo(size.height)
                        $0.bottom.equalTo(blueView.snp.top)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    var cancellables = Set<AnyCancellable>()
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension UITableView {
    var contentSizePublisher: AnyPublisher<CGSize, Never> {
        publisher(for: \.contentSize)
            .eraseToAnyPublisher()
    }
}

extension UICollectionView {
    var contentSizePublisher: AnyPublisher<CGSize, Never> {
        publisher(for: \.contentSize)
            .eraseToAnyPublisher()
    }
}
