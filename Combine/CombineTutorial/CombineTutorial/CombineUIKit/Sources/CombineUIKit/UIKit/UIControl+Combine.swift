import UIKit
import Combine

public extension CombineReactive where Base: UIControl {
    func publisher(_ event: UIControl.Event) -> AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: base, event: event)
            .eraseToAnyPublisher()
    }
    
    var tap: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: base, event: .touchUpInside)
            .eraseToAnyPublisher()
    }
}
