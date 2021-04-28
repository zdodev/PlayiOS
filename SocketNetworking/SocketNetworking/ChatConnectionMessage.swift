import Foundation

struct ChatConnectionMessage {
    func createJoinMessageFormat(username: String) -> Data {
        "iam:\(username)".data(using: .utf8)!
    }
}
