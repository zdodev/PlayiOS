import Foundation

struct WebRepository: WebRepositoryProtocol {
    let urlSession: URLSession
    let host: String
}
