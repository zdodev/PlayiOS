import UIKit
import Combine
import KakaoSDKUser

final class MainViewController: UIViewController {
    override func loadView() {
        view = MainView()
    }
}

fileprivate final class MainView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    private let loginButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("로그인", for: .normal)
        return button
    }()
    private let validateButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("유효성 검증", for: .normal)
        return button
    }()
    private let logoutButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("로그아웃", for: .normal)
        return button
    }()
    private let accessTokenTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "AccessToken"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private let accessTokenLabel = UILabel()
    private let errorTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let viewModel = MainViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground
        
        setLayout()
        setConstraints()
        setBind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        addSubview(stackView)
        addSubview(activityIndicatorView)
        
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(validateButton)
        stackView.addArrangedSubview(logoutButton)
        stackView.addArrangedSubview(accessTokenTitleLabel)
        stackView.addArrangedSubview(accessTokenLabel)
        stackView.addArrangedSubview(errorTitleLabel)
        stackView.addArrangedSubview(errorLabel)
    }
    
    func setConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.directionalHorizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        activityIndicatorView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }
    }
    
    func setBind() {
        viewModel.$isLoading
            .sink { [weak self] in
                if $0 {
                    self?.activityIndicatorView.startAnimating()
                    return
                }
                
                self?.activityIndicatorView.stopAnimating()
            }
            .store(in: &cancellables)
        
        viewModel.$accessToken
            .sink { [weak self] in
                self?.accessTokenLabel.text = $0
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .sink { [weak self] in
                self?.errorLabel.text = $0
            }
            .store(in: &cancellables)
        
        loginButton.addTarget(
            self,
            action: #selector(tappedKakaoLoginButton),
            for: .touchUpInside
        )
        
        validateButton.addTarget(
            self,
            action: #selector(tappedValidateButton),
            for: .touchUpInside
        )
        
        logoutButton.addTarget(
            self,
            action: #selector(tappedKakaoLogoutButton),
            for: .touchUpInside
        )
    }
    
    @objc func tappedKakaoLoginButton() {
        viewModel.action(.kakaoLogin)
    }
    
    @objc func tappedValidateButton() {
        viewModel.action(.validateToken)
    }
    
    @objc func tappedKakaoLogoutButton() {
        viewModel.action(.kakaoLogout)
    }
}
