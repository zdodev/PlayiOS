import KakaoSDKCommon

struct ErrorService {
    func errorMessage(_ error: Error) -> String? {
        if let error = error as? SdkError {
            switch error {
            case .ClientFailed(_, let errorMessage):
                return errorMessage
            case .ApiFailed(_, let errorInfo):
                return errorInfo?.msg
            case .AuthFailed(_, let errorInfo):
                return errorInfo?.errorDescription
            case .AppsFailed(_, let errorInfo):
                return errorInfo?.errorMsg
            }
        }
        
        return error.localizedDescription
    }
}
