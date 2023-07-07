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
    /*
     뷰의 bounds가 변하면 뷰는 하위 뷰(subView)들의 위치를 조정하게 됩니다.
     viewWillLayoutSubviews는 뷰의 bounds가 변해서,
     뷰가 서브뷰의 배치를 조정하기 직전임을 뷰 컨트롤러에게 알리는 메서드입니다.
     뷰가 자신의 서브뷰들의 배치를 조정하기 전에 하고 싶은게 있다면 viewWillLayoutSubviews를 override하면 됩니다.
     - 뷰를 추가하거나 제거할 때
     - 뷰의 크기나 위치를 업데이트할 때
     - 레이아웃 constraint를 업데이트할 때
     - 뷰와 관련된 기타 프로퍼티들을 업데이트할 때
     */
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("ViewController::viewWillLayoutSubviews()")
        print(layoutView.frame)
    }
    
    /*
     뷰가 서브 뷰의 배치를 다했다는 소식을 뷰 컨트롤러에게 알립니다.
     뷰가 서브 뷰들의 배치를 조정한 직후에 하고 싶은 작업이 있다면
     마찬가지로 viewDidLayoutSubviews를 override하면 됩니다.
     
     즉, 레이아웃이 결정되고 나서 아래와 같은 일을 수행하고자 할 때 이 메서드를 override하여 사용하면 되는거죠.
     - 다른 뷰들의 콘텐츠 업데이트
     - 뷰들의 크기나 위치를 최종적으로 조정
     - 테이블의 데이터를 reload
     */
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

