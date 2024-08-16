import Foundation

struct UltraSrtNcst: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let header: Header
        let body: Body
        
        struct Header: Decodable {
            let resultCode: String // 응답메시지 코드
            let resultMsg: String // 응답메시지 내용
        }
        
        struct Body: Decodable {
            let dataType: String // 데이터타입
            let items: Items
            let pageNo: Int // 페이지 번호
            let numOfRows: Int // 한 페이지 결과 수
            let totalCount: Int // 데이터 총 개수
            
            struct Items: Decodable {
                let item: [Item]
                
                struct Item: Decodable {
                    let baseDate: String // 발표일자
                    let baseTime: String // 발표시각
                    /*
                     PTY: 강수형태(코드값)
                     REH: 습도(%)
                     RN1: 1시간 강수량(mm)
                     T1H: 기온(°C)
                     UUU: 동서바람성분(m/s)
                     VEC: 풍향(deg)
                     VVV: 남북바람성분(m/s)
                     WSD: 풍속(m/s)
                     */
                    let category: String // 자료구분코드
                    let nx: Int // 예보지점 X 좌표
                    let ny: Int // 예보지점 Y 좌표
                    let obsrValue: String // 실황 값
                }
            }
        }
    }
}
