import UIKit
import Combine

final class ScrollViewDelegateProxy: NSObject, UIScrollViewDelegate {
    private var subscribers = [AnySubscriber<UIScrollView, Never>]()
    private let scrollView: UIScrollView
    
    init(_ scrollView: UIScrollView) {
        self.scrollView = scrollView
        
        super.init()
        
        scrollView.delegate = self
    }
    
    func scrollPub() -> AnyPublisher<UIScrollView, Never> {
        ScrollViewDidScrollPublisher<UIScrollView> { subscriber in
            self.subscribers.append(subscriber)
        }
        .eraseToAnyPublisher()
    }
    
    func setDelegate(to scrollView: UIScrollView) {
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        _ = subscribers[0].receive(scrollView)
    }
    
    deinit {
        print("제거됨")
    }
}

struct ScrollViewDidScrollPublisher<Output>: Publisher {
    typealias Failure = Never
    
    private let handler: (AnySubscriber<Output, Failure>) -> Void
    
    init(handler: @escaping (AnySubscriber<Output, Failure>) -> Void) {
        self.handler = handler
    }
    
    func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, Output == S.Input {
        let subscription = ScrollViewDidScrollSubscription(
            subscriber: AnySubscriber(subscriber),
            handler: handler
        )
        subscriber.receive(subscription: subscription)
    }
}

class ScrollViewDidScrollSubscription<S: Subscriber>: Subscription {
    private var subscriber: S?
    
    init(subscriber: S, handler: @escaping (S) -> Void) {
        self.subscriber = subscriber
        handler(subscriber)
    }
    
    func request(_ demand: Subscribers.Demand) {
        
    }
    
    func cancel() {
        subscriber = nil
    }
}

