import CoreLocation

@Observable
final class LocationService: NSObject {
    private(set) var address = ""
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func detectLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        Task {
            let geocoder = CLGeocoder()
            let placemark = try! await geocoder.reverseGeocodeLocation(locations.first!).first!
            print(placemark)
            print("location: \(placemark.location)")
            print("name: \(placemark.name)")
            print("thoroughfare: \(placemark.thoroughfare)")
            print("subThoroughfare: \(placemark.subThoroughfare)")
            print("locality: \(placemark.locality)")
            print("subLocality: \(placemark.subLocality)")
            print("administrativeArea: \(placemark.administrativeArea)")
            print("subAdministrativeArea: \(placemark.subAdministrativeArea)")
            print("postalCode: \(placemark.postalCode)")
            print("isoCountryCode: \(placemark.isoCountryCode)")
            print("country: \(placemark.country)")
            print("inlandWater: \(placemark.inlandWater)")
            print("ocean: \(placemark.ocean)")
            print("areasOfInterest: \(placemark.areasOfInterest)")
            print("timeZone: \(placemark.timeZone)")
            
            let country = placemark.country ?? "없음"
            let locality = placemark.locality ?? "없음"
            let thoroughfare = placemark.thoroughfare ?? "없음"
            
            address = "\(country) \(locality) \(thoroughfare)"
        }
    }
}
