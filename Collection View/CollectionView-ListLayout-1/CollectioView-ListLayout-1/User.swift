import Foundation

struct User: Decodable {
    let id: Int
    let name: String
}

extension User: Hashable {
    
}
