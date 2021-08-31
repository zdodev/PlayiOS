import UIKit

final class MainView: UIView {
    
    // MARK: - Observing View Related Changes
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        
        print("MainView::didAddSubview(_:)")
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        
        print("MainView::willRemoveSubview(_:)")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        print("MainView::willMove(toSuperview:)")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        print("MainView::didMoveToSuperview()")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        print("MainView::willMove(toWindow:)")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        print("MainView::didMoveToWindow()")
    }
    
    // MARK: - Configuring Content Margins
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        
        print("MainView::layoutMarginsDidChange()")
    }
    
    // MARK: - Getting the Safe Area
    
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        
        print("MainView::safeAreaInsetsDidChange()")
    }
    
    // MARK: - Triggering Auto Layout
    
    override func updateConstraints() {
        print("MainView::updateConstraints()")
        
        super.updateConstraints()
    }
}
