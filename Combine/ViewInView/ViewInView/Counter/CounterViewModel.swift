import Combine

final class CounterViewModel {
    @Published var count = Count(count: 0)
    
    func increaseCount() {
        count.count += 1
    }
    
    func decreaseCount() {
        count.count -= 1
    }
}
