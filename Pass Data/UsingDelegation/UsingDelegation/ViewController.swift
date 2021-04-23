import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    // 데이터 모델 선언
    private let dataModel = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 데이터 모델의 델리게이트라고 선언
        dataModel.delegate = self
        // 데이터 모델의 데이터를 받을 수 있는 메서드 실행(트리거 발동)
        dataModel.requestData()
    }
}

// 델리게이트 프로토콜을 채택
extension ViewController: DataModelDelegate {
    // 데이터 모델에서 실행될 메서드 정의
    func didReceiveDataUpdate(data: String) {
        textLabel.text = data
    }
}

