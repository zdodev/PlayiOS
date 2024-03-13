import Combine

struct DelegateProxyPublisher<Output>: Publisher {
    typealias Failure = Never
    
    private let handler: (AnySubscriber<Output, Failure>) -> Void
    
    init(handler: @escaping (AnySubscriber<Output, Failure>) -> Void) {
        self.handler = handler
    }
    
    func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, Output == S.Input {
        let subscription = DelegateProxySubscription(
            subscriber: AnySubscriber(subscriber),
            handler: handler
        )
        subscriber.receive(subscription: subscription)
    }
}

private extension DelegateProxyPublisher {
    final class DelegateProxySubscription<S>: Subscription {
        private var subscriber: S?
        
        init(subscriber: S, handler: (S) -> Void) {
            self.subscriber = subscriber
            handler(subscriber)
        }
        
        func request(_ demand: Subscribers.Demand) { }
        
        func cancel() {
            subscriber = nil
        }
    }
}
