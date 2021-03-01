import UIKit

class ViewController: UIViewController {
    // 모델 인스턴스 생성
    private let dataModel = DataModel()
    private var ee: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 모델의 메서드 호출
        dataModel.requestData { [unowned self] data in
            // ViewController의 메서드를 실행하는 클로저 전달
            self.useData(data: data)
        }
    }
    
    private func useData(data: String) {
        print(data)
    }
}

// Model 정의
class DataModel {
    private let data = "zdo's data"
    
    func requestData(completion: ((_ data: String) -> Void)) {
        // 클로저에 data 인자를 전달하여 실행
        completion(data)
    }
}

