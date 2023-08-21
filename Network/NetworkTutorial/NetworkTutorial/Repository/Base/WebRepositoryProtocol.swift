import Foundation

protocol WebRepositoryProtocol {
    var urlSession: URLSession { get }
    var host: String { get }
}

extension WebRepositoryProtocol {
    func request<Value>(endpoint: HTTPRequestType, _ completion: @escaping (Result<Value, Error>) -> Void) where Value: Decodable {
        let urlRequest = endpoint.urlRequest(baseURL: host)
        urlSession.dataTask(with: urlRequest) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            if let data {
                do {
                    let decodedData = try JSONDecoder().decode(
                        Value.self,
                        from: data
                    )
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
    
    func request<Value>(endpoint: HTTPRequestType) async throws -> Value where Value: Decodable {
        let urlRequest = endpoint.urlRequest(baseURL: host)
        let (data, response) = try await urlSession.data(for: urlRequest)
        let decodeData = try JSONDecoder().decode(Value.self, from: data)
        return decodeData
    }
}
