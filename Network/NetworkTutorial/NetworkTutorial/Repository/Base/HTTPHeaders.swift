struct HTTPHeaders {
    private let headers: [HTTPHeader]
    
    var dictionary: [String: String] {
        let tupleHeader = headers.map { ($0.name, $0.value) }
        
        return Dictionary(
            tupleHeader) { _, last in
                last
            }
    }
    
    init(headers: [HTTPHeader]) {
        self.headers = headers
    }
}
