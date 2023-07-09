import Foundation

extension URLRequest {
    init(url: URL, method: HTTPMethod, headers: HTTPHeaders? = nil, body: Data? = nil) {
        self.init(url: url)
        
        httpMethod = method.rawValue
        allHTTPHeaderFields = headers?.dictionary
        httpBody = body
    }
}
