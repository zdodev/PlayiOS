import UIKit

final class ViewController: UIViewController {
    override func loadView() {
        super.loadView()
        
        print("call... loadView()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("call... viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("call... viewWillAppear(_:)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("call... viewDidAppear(_:)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("call... viewWillDisappear(_:)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("call... viewDidDisappear(_:)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("call... viewWillLayoutSubviews()")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("call... viewDidLayoutSubviews()")
    }
    
    override func updateViewConstraints() {
        print("call... updateViewConstrains()")
        
        super.updateViewConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        print("call... viewWillTransition(to:with:)")
    }
}
