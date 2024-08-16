import Foundation

// 람베르트 등적 투영법

struct LambertConformalConicParameter {
    let RadiusOfEarth = 6371.00877
    let grid = 5.0
    let slat1 = 30.0
    let slat2 = 60.0
    let olon = 126.0
    let olat = 38.0
    let xo = 42.0
    let yo = 135.0
}

struct GridCoordinate {
    let x: Int
    let y: Int
}

class LCC {
    let latitude: Double
    let longitude: Double
    let map = LambertConformalConicParameter()
    
    // 금천 58, 125
    init() {
        latitude = 37.478750
        longitude = 126.881860
    }
    
    func start() {
        print(convertToGrid(latitude: latitude, longitude: longitude))
    }
    
    func convertToGrid(latitude: Double, longitude: Double) -> GridCoordinate {
        let pi = Double.pi
        let degrad: Double
        let re, olon, olat: Double
        let slat1, slat2: Double
        var sn, sf, ro: Double
        var ra, theta: Double
        
        degrad = pi / 180
        
        re = map.RadiusOfEarth / map.grid
        slat1 = map.slat1 * degrad
        slat2 = map.slat2 * degrad
        olon = map.olon * degrad
        olat = map.olat * degrad
        
        sn = tan(pi * 0.25 + slat2 * 0.5) / tan(pi * 0.25 + slat1 * 0.5)
        sn = log(cos(slat1) / cos(slat2)) / log(sn)
        sf = tan(pi * 0.25 + slat1 * 0.5)
        sf = pow(sf, sn) * cos(slat1) / sn
        ro = tan(pi * 0.25 + olat * 0.5)
        ro = re * sf / pow(ro, sn)
        
        ra = tan(pi * 0.25 + latitude * degrad * 0.5)
        ra = re * sf / pow(ra, sn)
        theta = longitude * degrad - olon
        if (theta > pi) {
            theta -= 2 * pi
        }
        if (theta < -pi) {
            theta += 2 * pi
        }
        theta *= sn
        let newX = ra * sin(theta) + map.xo + 1.5
        let newY = ro - ra * cos(theta) + map.yo + 1.5
        
        return GridCoordinate(x: Int(newX), y: Int(newY))
    }
}
