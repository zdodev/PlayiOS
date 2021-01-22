//
//  ViewController.swift
//  Map
//
//  Created by Zero DotOne on 2021/01/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
    
}

