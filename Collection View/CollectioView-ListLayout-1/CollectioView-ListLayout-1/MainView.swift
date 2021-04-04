//import UIKit
//
//class MainView: UIView {
//    lazy var collectionView: UICollectionView = {
//        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        
//        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .systemGroupedBackground
//        return collectionView
//    }()
//    
//    init() {
//        super.init(frame: .zero)
//        setup()
//        setupSubviews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    func setup() {
//        backgroundColor = .blue
//    }
//    
//    func setupSubviews() {
//        addSubview(collectionView)
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
//}
