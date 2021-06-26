// 델리게이트 프로토콜 정의
protocol DataModelDelegate: class {
    func didReceiveDataUpdate(data: String)
}

// 데이터 모델 정의
class DataModel {
    // 데이터 정의
    let data = "Data from wherever"
    
    // 델리게이트 프로퍼티 선언
    weak var delegate: DataModelDelegate?
    
    // 트리거가 될 메서드
    func requestData() {
        // 델리게이트 프로퍼티에 값이 있을 경우 data를 넣어서 실행
        delegate?.didReceiveDataUpdate(data: data)
    }
}
