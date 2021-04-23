class DataModel {
    // 데이터 생성
    let data = "Data from wherever"
    
    func requestData(completion: ((_ data: String) -> Void)) {
        // 전달받은 클로저에 모델 데이터를 넣어서 호출
        completion(data)
    }
}
