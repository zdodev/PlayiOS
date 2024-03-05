import UIKit
import Combine

extension UIScrollView: CombineCompatible { }

public extension CombineReactive where Base: UIScrollView {
    var contentOffset: AnyPublisher<CGPoint, Never> {
        base.publisher(for: \.contentOffset)
            .eraseToAnyPublisher()
    }
}
