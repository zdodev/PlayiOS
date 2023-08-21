import Foundation

protocol PlaceholderRepositoryProtocol {
    func requestPosts(_ completion: @escaping (Result<[PostModel], Error>) -> Void)
    func requestPosts() async throws -> [PostModel]
}

struct PlaceholderRepository: PlaceholderRepositoryProtocol {
    private let webRepository: WebRepositoryProtocol
    
    init(webRepository: WebRepositoryProtocol) {
        self.webRepository = webRepository
    }
    
    func requestPosts(_ completion: @escaping (Result<[PostModel], Error>) -> Void) {
        webRepository.request(endpoint: API.requestPosts, completion)
    }
    
    func requestPosts() async throws -> [PostModel] {
        try await webRepository.request(endpoint: API.requestPosts)
    }
}

extension PlaceholderRepository {
    enum API {
        case requestPosts
        case requestPostsAsync
    }
}

extension PlaceholderRepository.API: HTTPRequestType {
    var path: String {
        switch self {
        case .requestPosts:
            return "/posts"
        case .requestPostsAsync:
            return "/posts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .requestPosts:
            return .get
        case .requestPostsAsync:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .requestPosts:
            return nil
        case .requestPostsAsync:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .requestPosts:
            return nil
        case .requestPostsAsync:
            return nil
        }
    }
}

struct PostModel: Decodable {
    let userId: Int
}
