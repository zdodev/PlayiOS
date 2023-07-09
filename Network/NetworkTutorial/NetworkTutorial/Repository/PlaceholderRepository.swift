import Foundation

protocol PlaceholderRepositoryProtocol {
    func requestPosts(_ completion: @escaping (Result<[PostModel], Error>) -> Void)
}

struct PlaceholderRepository: PlaceholderRepositoryProtocol {
    private let webRepository: WebRepositoryProtocol
    
    init(webRepository: WebRepositoryProtocol) {
        self.webRepository = webRepository
    }
    
    func requestPosts(_ completion: @escaping (Result<[PostModel], Error>) -> Void) {
        webRepository.request(endpoint: API.requestPosts, completion)
    }
}

extension PlaceholderRepository {
    enum API {
        case requestPosts
    }
}

extension PlaceholderRepository.API: HTTPRequestType {
    var path: String {
        switch self {
        case .requestPosts:
            return "/posts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .requestPosts:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .requestPosts:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .requestPosts:
            return nil
        }
    }
}

struct PostModel: Decodable {
    let userId: Int
}
