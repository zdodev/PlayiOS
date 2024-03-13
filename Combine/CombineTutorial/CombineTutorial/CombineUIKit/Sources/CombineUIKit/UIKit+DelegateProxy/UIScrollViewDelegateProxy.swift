import UIKit
import Combine

final class UIScrollViewDelegateProxy: DelegateProxy {
    enum DelegateMethod {
        case scrollViewDidScroll
        case scrollViewWillBeginDragging
    }
    
    private var subscribers = [DelegateMethod: AnySubscriber<[Any], Never>]()

    func delegatePublisher(_ delegateMethod: DelegateMethod) -> AnyPublisher<[Any], Never> {
        DelegateProxyPublisher<[Any]> { subscriber in
            self.subscribers[delegateMethod] = subscriber
        }
        .eraseToAnyPublisher()
    }
    
    deinit {
        subscribers.values.forEach { subscriber in
            subscriber.receive(completion: .finished)
        }
    }
}

extension UIScrollViewDelegateProxy: DelegateProxyType {
    func setDelegate(to object: UIScrollView) {
        object.delegate = self
    }
}

extension UIScrollViewDelegateProxy: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        _ = subscribers[.scrollViewDidScroll]?.receive([scrollView])
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        _ = subscribers[.scrollViewWillBeginDragging]?.receive([scrollView])
    }
}
