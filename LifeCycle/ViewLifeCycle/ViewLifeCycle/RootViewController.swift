import UIKit

final class RootViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        print("⭐️ \(#function)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Managing the View
    
    override func loadView() {
        super.loadView()
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    // MARK: - Responding to View Related Events
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    // MARK: - Extending the View's Safe Area
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    // MARK: - Managing the View's Margins
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
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
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
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
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    // MARK: - Responding to Containment Events
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        print("⭐️ \(#function)")
        print("view frame = \(view.frame)")
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
}
