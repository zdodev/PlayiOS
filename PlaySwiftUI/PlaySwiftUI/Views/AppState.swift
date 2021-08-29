import Foundation

struct AppState {
    var currentDice = "" {
        didSet {
            print(currentDice)
        }
    }
}
