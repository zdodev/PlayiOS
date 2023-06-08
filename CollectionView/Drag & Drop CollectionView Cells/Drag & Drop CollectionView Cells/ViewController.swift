import UIKit

final class ViewController: UIViewController {
    // 컬렉션 뷰 프로퍼티 선언
    private var collectionView: UICollectionView!
    
    // 컬렉션 뷰에 나타낼 UIColor 배열 정의
    var colors: [UIColor] = [
        .link,
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemTeal,
        .systemGray,
        .systemFill,
        .systemGreen,
        .systemOrange,
        .systemYellow,
        .systemPurple,
        .systemIndigo,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 컬렉션 뷰에 사용할 레이아웃 정의
        // A layout object that organizes items into a grid with optional header and footer views for each section.
        // 각 섹션에 대한 헤더 및 푸터를 사용하여 항목을 그리드 형태로 구성하는 레이아웃 객체입니다.
        let layout = UICollectionViewFlowLayout()
        // 셀에 사용할 기본 크기를 지정합니다.
        layout.itemSize = CGSize(width: view.frame.size.width / 3.2, height: view.frame.size.width / 3.2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        // 길게 누르는 제스처를 인식하는 제스처 생성
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        // 컬렉션 뷰에 제스처 인식기 등록
        collectionView.addGestureRecognizer(gesture)
    }
    
    // UILongPressGestureRecognizer 액션 메서드
    @objc private func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                return
            }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
    }
}

extension ViewController: UICollectionViewDataSource {
    // Asks your data source object for the number of items in the specified section.
    // 데이터 소스에 지정한 섹션의 항목 수를 요청합니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    // Asks your data source object for the cell that corresponds to the specified item in the collection view.
    // 데이터 소스에 컬렉션 뷰의 지정한 항목에 해당하는 셀을 요청합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    // Asks your data source object whether the specified item can be moved to another location in the collection view.
    // 데이터 소스에 컬렉션 뷰에서 지정한 항목이 다른 위치로 이동할 수 있는지 여부를 요청합니다.
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        true
    }
    
    // Tell your data source object to move the specified item to its new location.
    // 데이터 소스에 지정한 항목이 새로운 위치로 이동하도록 지시합니다.
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // 드래그한 항목을 현재 indexPath에서 삭제합니다.
        let item = colors.remove(at: sourceIndexPath.row)
        // 드래그한 항목을 새로운 위치의 indexPath에 삽입합니다.
        colors.insert(item, at: destinationIndexPath.row)
    }
}
