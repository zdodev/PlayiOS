import UIKit

final class FlipView: UIView {
    enum Direction {
        case front
        case rear
        
        mutating func toggle() {
            switch self {
            case .front:
                self = .rear
            case .rear:
                self = .front
            }
        }
    }
    
    private var frontView: UIView!
    private var rearView: UIView!
    private var direction: Direction = .front
    
    func setFlipViews(frontView: UIView, rearView: UIView) {
        self.rearView = rearView
        addSubview(rearView)
        
        self.frontView = frontView
        addSubview(frontView)
    }
    
    func flip() {
        switch direction {
        case .front:
            UIView.transition(from: frontView, to: rearView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
        case .rear:
            UIView.transition(from: rearView, to: frontView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
        }
        
        direction.toggle()
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        
        setFullScreenContraints(subview)
    }
    
    private func setFullScreenContraints(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
