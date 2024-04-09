import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

final class MainViewModel {
    enum Action {
        case kakaoLogin
        case kakaoLogout
        case validateToken
    }
    
    private let errorService = ErrorService()
    
    @Published private(set) var accessToken = "nil"
    @Published private(set) var errorMessage: String?
    @Published private(set) var isLoading = false
    
    init() {
        if let oauthToken = TokenManager.manager.getToken() {
            accessToken = oauthToken.accessToken
        }
    }
    
    func action(_ action: Action) {
        switch action {
        case .kakaoLogin:
            isLoading = true
            if UserApi.isKakaoTalkLoginAvailable() {
                UserApi.shared.loginWithKakaoTalk { [weak self] oauthToken, error in
                    self?.isLoading = false
                    if let error {
                        self?.errorMessage = error.localizedDescription
                        return
                    }
                    
                    self?.errorMessage = nil
                    
                    if let oauthToken {
                        self?.accessToken = oauthToken.accessToken
                        return
                    }
                    
                    self?.accessToken = "nil"
                }
                return
            }
            isLoading = false
        case .validateToken:
            isLoading = true
            UserApi.shared.accessTokenInfo { [weak self] accessTokenInfo, error in
                self?.isLoading = false
                if let error {
                    self?.errorMessage = self?.errorService.errorMessage(error)
                    return
                }
                
                self?.errorMessage = nil
                
                if let oauthToken = TokenManager.manager.getToken() {
                    self?.accessToken = oauthToken.accessToken
                }
            }
        case .kakaoLogout:
            isLoading = true
            UserApi.shared.logout { [weak self] error in
                self?.isLoading = false
                if let error {
                    self?.errorMessage = self?.errorService.errorMessage(error)
                    return
                }
                
                self?.accessToken = "nil"
            }
        }
    }
}
