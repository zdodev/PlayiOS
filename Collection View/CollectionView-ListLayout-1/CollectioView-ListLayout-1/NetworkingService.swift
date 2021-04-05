import Foundation

enum NetworkingService {
    static func requestUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/users")!) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let users = try? JSONDecoder().decode([User].self, from: data) {
                completion(.success(users))
            }
        }
        task.resume()
    }
}
