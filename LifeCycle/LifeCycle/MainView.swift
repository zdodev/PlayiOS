import UIKit

final class MainView: UIView {
    
    // MARK: - Observing View Related Changes
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        
        print("MainView::didAddSubview(_:) \(frame)")
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        
        print("MainView::willRemoveSubview(_:) \(frame)")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        print("MainView::willMove(toSuperview:) \(frame)")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        print("MainView::didMoveToSuperview() \(frame)")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        print("MainView::willMove(toWindow:) \(frame)")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        print("MainView::didMoveToWindow() \(frame)")
    }
    
    // MARK: - Configuring Content Margins
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        
        print("MainView::layoutMarginsDidChange() \(frame)")
    }
    
    // MARK: - Getting the Safe Area
    
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        
        print("MainView::safeAreaInsetsDidChange() \(frame)")
    }
    
    // MARK: - Triggering Auto Layout
    
    override func updateConstraints() {
        print("MainView::updateConstraints() \(frame)")
        
        super.updateConstraints()
    }
    
    // MARK: - Laying Out Subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print("MainView::layoutSubviews() \(frame)")
    }
}

