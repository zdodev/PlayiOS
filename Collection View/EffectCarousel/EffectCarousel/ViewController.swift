import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! // 컬렉션뷰 사이즈: width = 315 height = 347
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
        collectionView.backgroundColor = .clear
        self.view.backgroundColor = .brown
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print(view.frame.width, collectionView.frame.width)
    }
    
    func addCollectionView(){

        let layout = CarouselLayout()
        
        layout.itemSize = CGSize(width: collectionView.frame.size.width*0.796, height: collectionView.frame.size.height - 50)
//        layout.sideItemScale = 175/251
//        layout.spacing = -197
//        layout.isPagingEnabled = true
//        layout.sideItemAlpha = 0.5

        collectionView.collectionViewLayout = layout
            
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self

        self.collectionView?.register(CarouselCell.self, forCellWithReuseIdentifier: "carouselCell")
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as! CarouselCell

        cell.customView.backgroundColor = .white
        return cell
    }
    
    // paging 구현
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        // 셀 너비 + 셀 간격
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        print(estimatedIndex)
        
        let index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
    }
}
