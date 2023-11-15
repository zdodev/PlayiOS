import UIKit
import Combine

public extension UIControl {
    func controlEventPublisher(for event: UIControl.Event) -> AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, event: event)
            .eraseToAnyPublisher()
    }
}
