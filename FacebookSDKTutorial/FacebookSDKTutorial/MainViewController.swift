import UIKit
import FacebookLogin

final class MainViewController: UIViewController {
    private let facebookLoginButton = UIButton(configuration: .filled()).then {
        $0.setTitle("페이스북 로그인", for: .normal)
    }
    private let subButton = UIButton(configuration: .filled()).then {
        $0.setTitle("sub1", for: .normal)
    }
    private let logoutButton = UIButton(configuration: .filled()).then {
        $0.setTitle("logout", for: .normal)
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
        view.addSubview(subButton)
        view.addSubview(logoutButton)
        view.addSubview(accessTokenLabel)
        view.addSubview(authenticationTokenLabel)
        
        facebookLoginButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        subButton.snp.makeConstraints {
            $0.top.equalTo(facebookLoginButton.snp.bottom).offset(20)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(subButton.snp.bottom).offset(20)
            $0.directionalHorizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        accessTokenLabel.snp.makeConstraints {
            $0.top.equalTo(logoutButton.snp.bottom).offset(20)
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
        
        subButton.addTarget(
            self,
            action: #selector(tappedSubButton),
            for: .touchUpInside
        )
        
        logoutButton.addTarget(
            self, 
            action: #selector(tappedLogoutButton),
            for: .touchUpInside
        )
    }
    
    @objc func tappedFacebookLoginButton() {
        let loginManager = LoginManager()
        
        guard let configuaration = LoginConfiguration(permissions: ["public_profile"], tracking: .limited) else {
            print("error")
            return
        }
        
        loginManager.logIn(configuration: configuaration) { [weak self] result in
            switch result {
            case let .success(granted, declined, token):
                print(token?.tokenString)
            case let .failed(error):
                print(error)
            case .cancelled:
                print("cancelled")
            }
        }
    }
    
    @objc func tappedSubButton() {
        if let accessToken = AccessToken.current {
            print("accessToken: \(accessToken.tokenString)\n")
        }
        
        if let authenticationToken = AuthenticationToken.current {
            print("authenticationToken: \(authenticationToken.tokenString)")
        }
    }
    
    @objc func tappedLogoutButton() {
        let loginManager = LoginManager()
        
        loginManager.logOut()
    }
}
