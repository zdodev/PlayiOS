import Foundation

enum Gender {
    case male
    case female
    case unspecified
}

// Model
struct Person {
    let name: String
    let birthdate: Date? = nil
    let middleName: String? = nil
    let address: String? = nil
    let gender: Gender = .unspecified
    var username = "KanyeWest"
    
    init(name: String) {
        self.name = name
    }
}
