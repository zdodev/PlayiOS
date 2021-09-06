import UIKit
import Alamofire

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1").responseJSON { response in
            switch response.result {
                case .success(let res):
                    let jsonData = try! JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    let json = try! JSONDecoder().decode(Post.self, from: jsonData)
                    print(json)
                case .failure(let error):
                    print(error)
            }
        }
    }
}

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
