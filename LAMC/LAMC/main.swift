import Foundation

struct Network {
    let authKey = ""
    
    func request() {
        let baseURL = "https://apihub.kma.go.kr/api/typ02/openApi/VilageFcstInfoService_2.0/getUltraSrtNcst?authKey=\(authKey)&numOfRows=10&dataType=json&pageNo=1&base_date=20240816&base_time=1100&nx=58&ny=125"
        let url = URL(string: baseURL)!
        let urlRequest = URLRequest(url: url)
        
        Task {
            let result = try! await URLSession.shared.data(for: urlRequest)
            let decodedData = try! JSONDecoder().decode(UltraSrtNcst.self, from: result.0)
            print(decodedData)
        }
    }
}

let network = Network()
network.request()

RunLoop.main.run()
