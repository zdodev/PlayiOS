import UIKit
import Combine

extension UIScrollView: CombineCompatible { }

public extension CombineReactive where Base: CombineScrollView {
    var contentOffset: AnyPublisher<CGPoint, Never> {
        base.publisher(for: \.contentOffset)
            .eraseToAnyPublisher()
    }
    
    var scrollViewDidScroll: AnyPublisher<UIScrollView, Never> {
        base.scrollViewDidScrollPublisher
            .eraseToAnyPublisher()
    }
}
