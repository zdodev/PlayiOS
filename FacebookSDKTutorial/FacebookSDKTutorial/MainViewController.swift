import UIKit
import FacebookLogin

final class MainViewController: UIViewController {
    private let facebookLoginButton = UIButton(configuration: .filled()).then {
        $0.setTitle("페이스북 로그인", for: .normal)
    }
    private let accessTokenLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    private let authenticationTokenLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(facebookLoginButton)
        view.addSubview(accessTokenLabel)
        view.addSubview(authenticationTokenLabel)
        
        facebookLoginButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        accessTokenLabel.snp.makeConstraints {
            $0.top.equalTo(facebookLoginButton.snp.bottom).offset(20)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
        }
        
        authenticationTokenLabel.snp.makeConstraints {
            $0.top.equalTo(accessTokenLabel.snp.bottom).offset(20)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
        }
        
        facebookLoginButton.addTarget(
            self,
            action: #selector(tappedFacebookLoginButton),
            for: .touchUpInside
        )
    }
    
    @objc func tappedFacebookLoginButton() {
        let loginManager = LoginManager()
        loginManager.logIn(
            permissions: ["public_profile"],
            from: self
        ) { [weak self] result, error in
            if let error {
                print("💥: \(error)")
                return
            }
            
            if let result {
                self?.accessTokenLabel.text = result.token?.tokenString
                self?.authenticationTokenLabel.text = result.authenticationToken?.tokenString
            }
        }
    }
}
