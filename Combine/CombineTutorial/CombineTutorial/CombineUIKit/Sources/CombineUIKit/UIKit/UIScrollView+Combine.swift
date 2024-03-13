import UIKit
import Combine

extension UIScrollView: CombineCompatible { }

public extension CombineReactive where Base: UIScrollView {
    var contentOffset: AnyPublisher<CGPoint, Never> {
        base.publisher(for: \.contentOffset)
            .eraseToAnyPublisher()
    }
    
    var scrollViewDidScroll: AnyPublisher<UIScrollView, Never> {
        delegateProxy.delegatePublisher(.scrollViewDidScroll)
            .map { $0[0] as! UIScrollView }
            .eraseToAnyPublisher()
    }
    
    var scrollViewWillBeginDragging: AnyPublisher<UIScrollView, Never> {
        delegateProxy.delegatePublisher(.scrollViewWillBeginDragging)
            .map { $0[0] as! UIScrollView }
            .eraseToAnyPublisher()
    }

    private var delegateProxy: UIScrollViewDelegateProxy {
        UIScrollViewDelegateProxy.createDelegateProxy(for: base)
    }
}
