import UIKit
import Combine

extension Publishers {
    struct ControlEvent: Publisher {
        typealias Output = Void
        typealias Failure = Never
        
        private let control: UIControl
        private let event: UIControl.Event
        
        init(control: UIControl, event: UIControl.Event) {
            self.control = control
            self.event = event
        }
        
        func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = ControlEventSubscription(
                subscriber: subscriber,
                control: control,
                event: event
            )
            subscriber.receive(subscription: subscription)
        }
    }
}

extension Publishers.ControlEvent {
    private final class ControlEventSubscription<S: Subscriber>: Subscription where S.Input == Void {
        private var subscriber: S?
        
        init(subscriber: S, control: UIControl, event: UIControl.Event) {
            self.subscriber = subscriber
            control.addTarget(
                self,
                action: #selector(processControlEvent),
                for: event
            )
        }
        
        func request(_ demand: Subscribers.Demand) {
            
        }
        
        func cancel() {
            subscriber = nil
        }
        
        @objc private func processControlEvent() {
            _ = subscriber?.receive()
        }
    }
}
