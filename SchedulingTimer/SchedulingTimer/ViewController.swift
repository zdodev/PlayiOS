import UIKit

final class ViewController: UIViewController {
    private var timer: Timer?
    private var runCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        repeatingTimer1()
        
//        repeatingTimer2()
        
//        nonRepeatingTimer1()
        
//        nonRepeatingTimer2()
        
//        nonRepeatingTimer3()
        
//        endingTimer1()
        
//        endingTimer2()
        
//        endingTimer3()
        
//        dataTimer()
    }
    
    private func repeatingTimer1() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    private func repeatingTimer2() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
        }
    }
    
    private func nonRepeatingTimer1() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)
    }
    
    private func nonRepeatingTimer2() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            print("Timer fired!")
        }
    }
    
    private func nonRepeatingTimer3() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("Timer fired!")
        }
    }
    
    private func endingTimer1() {
        var runCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
            runCount += 1
            
            if runCount == 3 {
                timer.invalidate()
            }
        }
    }
    
    private func endingTimer2() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer1), userInfo: nil, repeats: true)
        
    }
    
    private func endingTimer3() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer2), userInfo: nil, repeats: true)
    }
    
    private func dataTimer() {
        let context = ["user": "zdodev"]
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer3), userInfo: context, repeats: true)
    }
}

extension ViewController {
    @objc private func fireTimer() {
        print("Timer fired!")
    }
    
    @objc private func fireTimer1() {
        print("Timer fired!")
        runCount += 1
        
        if runCount == 3{
            timer?.invalidate()
        }
    }
    
    @objc private func fireTimer2(timer: Timer) {
        print("Timer fired!")
        runCount += 1
        
        if runCount == 3 {
            timer.invalidate()
        }
    }
    
    @objc private func fireTimer3(timer: Timer) {
        guard let context = timer.userInfo as? [String: String] else {
            return
        }
        let user = context["user", default: "Anonymous"]
        
        print("Timer fired by \(user)!")
        runCount += 1
        
        if runCount == 3 {
            timer.invalidate()
        }
    }
}

