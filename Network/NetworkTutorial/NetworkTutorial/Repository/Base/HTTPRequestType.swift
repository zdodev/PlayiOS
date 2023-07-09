import Foundation

protocol HTTPRequestType {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var body: Data? { get }
}

extension HTTPRequestType {
    func urlRequest(baseURL: String) -> URLRequest {
        let url = URL(string: "\(baseURL)\(path)")!
        return URLRequest(
            url: url,
            method: method,
            headers: headers,
            body: body
        )
    }
}
