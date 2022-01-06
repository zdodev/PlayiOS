import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var layoutView: UIView!
    
    // MARK: - Managing the View
    
    override func loadView() {
        super.loadView()
        
        print("ViewController::loadView()")
        print(layoutView.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController::viewDidLoad()")
        print(layoutView.frame)
    }
    
    // MARK: - Responding to View Related Events
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ViewController::viewWillAppear(_:)")
        print(layoutView.frame)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("ViewController::viewDidAppear(_:)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ViewController::viewWillDisappear(_:)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("ViewController::viewDidDisappear(_:)")
    }
    
    // MARK: - Extending the View's Safe Area
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        print("ViewController::viewSafeAreaInsetsDidChange()")
        print(layoutView.frame)
    }
    
    // MARK: - Managing the View's Margins
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        
        print("ViewController::viewLayoutMarginsDidChange()")
        print(layoutView.frame)
    }
    
    // MARK: - Configuring the View's Layout Behavior
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("ViewController::viewWillLayoutSubviews()")
        print(layoutView.frame)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("ViewController::viewDidLayoutSubviews()")
        print(layoutView.frame)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        print("ViewController::updateViewConstraints()")
        print(layoutView.frame)
    }
    
    // MARK: - Managing Child View Controllers in a Custom Container
    
    override func beginAppearanceTransition(_ isAppearing: Bool, animated: Bool) {
        super.beginAppearanceTransition(isAppearing, animated: animated)
        
        print("ViewController::beginAppearanceTransition(_:animated:)")
        print(layoutView.frame)
    }
    
    override func endAppearanceTransition() {
        super.endAppearanceTransition()
        
        print("ViewController::endAppearanceTransition()")
    }
    
    // MARK: - Responding to Containment Events
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        
        print("ViewController::willMove()")
        print(layoutView.frame)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        print("ViewController::didMove()")
        print(layoutView.frame)
    }
    
    // MARK: - Handling Memory Warnings
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("ViewController::didReceiveMemoryWarning()")
    }
    
    // MARK: - Managing State Restoration
    
    override func applicationFinishedRestoringState() {
        super.applicationFinishedRestoringState()
        
        print("ViewController::applicationFinishedRestoringState()")
    }
    
    // MARK: - Performing Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("ViewController::prepare(for:sender:)")
    }
    
    @IBAction func tappedShowButton(_ sender: UIButton) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {
            return
        }
        
        show(secondViewController, sender: nil)
    }
    
    
    @IBAction func tappedPresent(_ sender: UIButton) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {
            return
        }
        
        present(secondViewController, animated: true)
    }
}

