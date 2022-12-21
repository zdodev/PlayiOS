import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {}

struct Test {
    static func request(_ string: String) {
        let urlString = "http://131.186.24.65:8000/debug"
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = string.data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, _ in
            print(data)
        }
        .resume()
    }
}
