// 콜백 메서드(컴플리션 핸들러) 호출을 통한 데이터 전달

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    private let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 데이터 모델에 클로저 전달
        dataModel.requestData { [weak self] (data) in
            // 클로저는 모델에 전달되고 실행
            self?.useData(data: data)
        }
    }
    
    private func useData(data: String) {
        textLabel.text = data
    }
}
