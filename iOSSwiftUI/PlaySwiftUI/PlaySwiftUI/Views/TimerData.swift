import Foundation
import Combine

final class TimerData: ObservableObject {
    @Published var timeCount = 0
    private var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
        print(timeCount)
    }
    
    func resetCount() {
        timeCount = 0
    }
}
