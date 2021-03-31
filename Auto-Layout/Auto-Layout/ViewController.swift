import UIKit

class ViewController: UIViewController {
    let button = UIButton()
    let label = UILabel()
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupUI()
        setupThreeUIView()
    }
    
    private func setupUI() {
        view.addSubview(button)
        
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .systemTeal
        
        // button frame(좌표와 크기) 설정
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        // button auto layout을 적용하기 위해 해당 프로퍼티 false 설정
        button.translatesAutoresizingMaskIntoConstraints = false
        // button의 x좌표(가운데)를 view의 가운데로 설정하고 활성화
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // button의 y좌표(가운데)를 view의 가운데로 설정하고 활성화
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // button의 가로를 200으로 설정하고 활성화
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        // button의 높이를 200으로 설정하고 활성화
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        label.text = "Label"
        label.backgroundColor = .cyan
        view.addSubview(label)

        // label auto layout을 적용하기 위해 해당 프로퍼티 false 설정
        label.translatesAutoresizingMaskIntoConstraints = false
        // label 상단을 button의 하단과 차이를 30만큼 두고 활성화
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30).isActive = true
        // label 왼쪽과 view의 왼쪽의 차이를 30만큼 두고 활성화
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        // label 오른쪽과 view의 오른쪽의 차이를 -30만큼 두고 활성화
        // 기준이 label 이므로 30만큼 차이를 주면 view의 오른쪽에서 오른쪽 방향으로 30만큼 더 커진 label이 설정되므로 음수로 설정
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    private func setupThreeUIView() {
        firstView.frame = CGRect(x: 0, y: 0, width: view.frame.width / 3, height: view.frame.height)
        firstView.backgroundColor = .cyan
        view.addSubview(firstView)
        
        secondView.frame = CGRect(x: view.frame.width / 3, y: 0, width: view.frame.width / 3, height: view.frame.height)
        secondView.backgroundColor = .systemGreen
        view.addSubview(secondView)
        
        thirdView.frame = CGRect(x: view.frame.width / 3 * 2, y: 0, width: view.frame.width / 3, height: view.frame.height)
        thirdView.backgroundColor = .systemBlue
        view.addSubview(thirdView)
    }
}

