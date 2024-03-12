//import UIKit
//import Combine
//
//open class CombineScrollView: UIScrollView {
//    lazy var scrollViewDidScrollPublisher = PassthroughSubject<UIScrollView, Never>()
//    lazy var scrollViewWillBeginDragging = PassthroughSubject<UIScrollView, Never>()
//    
//    public init() {
//        super.init(frame: .zero)
//        
//        delegate = self
//    }
//    
//    required public init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension CombineScrollView: UIScrollViewDelegate {
//    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        scrollViewDidScrollPublisher.send(scrollView)
//    }
//    
//    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        scrollViewWillBeginDragging.send(scrollView)
//    }
//}
