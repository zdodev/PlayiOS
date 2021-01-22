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

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}

