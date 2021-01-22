//
//  ViewController.swift
//  Map
//
//  Created by Zero DotOne on 2021/01/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        // 정확도를 최고로 설정합니다.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 추적하기 위해 사용자에게 승인을 요청합니다.
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트를 시작합니다.
        locationManager.startUpdatingHeading()
        // 위치 보기 값을 true로 설정합니다.
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeVale: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) {
        // 위도 값과 경도 값을 매개변수로 하여 CLLocationCoordinate2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받습니다.
        let pLocation = CLLocationCoordinate2DMake(latitudeVale, longitudeValue)
        // 범위 값을 매개변수로 하여 MKCoordinateSpan 함수를 호출하고, 리턴 값을 spanValue로 받습니다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        // pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegion 함수를 호출하고 리턴 값을 pRegion으로 받습니다.
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        // pRegion 값을 매개변수로 하여 myMap.setRegion 함수를 호출합니다.
        myMap.setRegion(pRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아냅니다.
        let pLocation = locations.last
        // 마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출합니다.
        // delta 갑슨 지도의 크기를 정하는데, 값이 작을수록 확대되는 효과가 있습니다. 1의 값보다 지도를 100배로 확대해서 보여 줄 것입니다.
        goLocation(latitudeVale: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}

