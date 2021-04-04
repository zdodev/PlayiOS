import UIKit

class ViewController: UIViewController {
    private var red = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        red.frame = CGRect(x: 30, y: 50, width: 50, height: 50)
        red.backgroundColor = UIColor.systemRed.cgColor
        view.layer.addSublayer(red)
        
        let buttonAction = UIAction { (action) in
            let animation = CABasicAnimation()
            animation.keyPath = "position.x"
            animation.fromValue = 30
            animation.toValue = 200
            animation.duration = 1
            
            self.red.add(animation, forKey: "basic")
            // 가서 있다
            self.red.position = CGPoint(x: 200, y: 50)
        }
        
        let animationButton = UIButton(frame: CGRect(x: 300, y: 50, width: 40, height: 40), primaryAction: buttonAction)
        
        animationButton.setTitle("animation", for: .normal)
        animationButton.setTitleColor(.black, for: .normal)
        view.addSubview(animationButton)
        
        // 프레젠테이션 레이어
        // - 애니메이션되는 궤적을 말한다.
        // 모델 레이어
        // - 실제 위치
    }
}

