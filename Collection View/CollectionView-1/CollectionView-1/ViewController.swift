import UIKit

class ViewController: UIViewController {
    // View
    // UICollectionView 아웃렛 변수 선언
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
    }
}

// 컬렉션 뷰에서 콘텐츠와 사용자 상호작용을 관리하기 위한 프로토콜
extension ViewController: UICollectionViewDelegate {
    // Managing the Selected Cells
    // 지정한 인덱스 패스에 있는 항목을 선택할 때 호출합니다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Selecting Cells
        // 지정한 인덱스의 항목을 선택 해제합니다.
        collectionView.deselectItem(at: indexPath, animated: true)
        print("cell: \(indexPath)")
    }
}

// 컬렉션 뷰에서 데이터를 관리하고 셀을 제공하기 위한 프로토콜
extension ViewController: UICollectionViewDataSource {
    // Getting Item and Section Metrics
    // 지정한 섹션의 항목 수를 요청합니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    // Getting Views for Items
    // 지정한 항목에 해당하는 셀을 요청합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Creating Cells
        // 식별자로 찾은 재사용 가능한 셀을 대기열 큐에서 가져옵니다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: UIImage(named: "bird")!)
        print("cellForItemAt: \(indexPath)")
        return cell
    }
}

// 플로우 레이아웃을 조정하여 그리드 기반의 레이아웃을 구현하기 위한 프로토콜
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 120)
    }
}
