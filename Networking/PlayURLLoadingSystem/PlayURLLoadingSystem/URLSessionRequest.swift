import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct URLSessionRequest {
    var urlSession: URLSession!
    
    init() {
        urlSession = URLSession.shared
    }
    
    func requestGet() {
        let url = url.appendingPathComponent("1")
        let urlRequest = URLRequest(url: url)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { receivedData, urlResponse, error in
            guard let data = receivedData else {
                return
            }
            
            guard let post = try? JSONDecoder().decode(GetData.self, from: data) else {
                return
            }
            
            print(post)
        }
        dataTask.resume()
        
        struct GetData: Decodable {
            let userId: Int
            let id: Int
            let title: String
            let body: String
        }
    }
    
    func requestPost() {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let dataTask = urlSession.dataTask(with: urlRequest) { receivedData, urlResponse, error in
            guard let data = receivedData else {
                return
            }
            
            guard let post = try? JSONDecoder().decode(PostData.self, from: data) else {
                return
            }
            
            print(post)
        }
        dataTask.resume()
        
        struct PostData: Decodable {
            let id: Int
        }
    }
    
    func requestPut() {
        let url = url.appendingPathComponent("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        
        let dataTask = urlSession.dataTask(with: urlRequest) { receivedData, response, error in
            guard let data = receivedData else {
                return
            }
            
            guard let post = try? JSONDecoder().decode(PutData.self, from: data) else {
                return
            }
            
            print(post)
        }
        dataTask.resume()
        
        struct PutData: Decodable {
            let id: Int
        }
    }
    
    func requestPatch() {
        let url = url.appendingPathComponent("1")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        
        let dataTask = urlSession.dataTask(with: urlRequest) { receivedData, response, error in
            guard let data = receivedData else {
                return
            }
            
            guard let post = try? JSONDecoder().decode(PatchData.self, from: data) else {
                return
            }
            
            print(post)
        }
        dataTask.resume()
        
        struct PatchData: Decodable {
            let userId: Int
            let id: Int
            let title: String
            let body: String
        }
    }
}
