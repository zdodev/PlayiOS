import UIKit
import Combine

final class UIScrollViewDelegateProxy: DelegateProxy {
    enum DelegateMethod {
        case scrollViewDidScroll
    }
    
    private var subscribers = [DelegateMethod: AnySubscriber<Any, Never>]()

    func delegatePublisher(_ delegateMethod: DelegateMethod) -> AnyPublisher<Any, Never> {
        DelegateProxyPublisher<Any> { [self] subscriber in
            subscribers[.scrollViewDidScroll] = subscriber
        }
        .eraseToAnyPublisher()
    }
}

extension UIScrollViewDelegateProxy: DelegateProxyType {
    func setDelegate(to object: UIScrollView) {
        object.delegate = self
    }
}

extension UIScrollViewDelegateProxy: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        _ = subscribers[.scrollViewDidScroll]?.receive(scrollView)
    }
}
