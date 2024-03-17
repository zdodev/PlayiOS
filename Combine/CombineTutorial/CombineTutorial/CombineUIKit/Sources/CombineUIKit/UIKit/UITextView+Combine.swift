import UIKit
import Combine

public extension CombineReactive where Base: UITextView {
    var textViewDidBeginEditing: AnyPublisher<UITextView, Never> {
        delegateProxy.delegatePublisher(.textViewDidBeginEditing)
            .map { $0[0] as! UITextView }
            .eraseToAnyPublisher()
    }

    private var delegateProxy: UIScrollViewDelegateProxy {
        UIScrollViewDelegateProxy.createDelegateProxy(for: base)
    }
}
