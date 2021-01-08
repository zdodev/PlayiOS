//
//  ReadViewController.swift
//  UIDevelopmenProgrammatically
//
//  Created by Zero DotOne on 2021/01/08.
//

import UIKit

class ReadViewContoller: UIViewController {
    var email: String?
    var updateSwitch: Bool?
    var intervalValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        
        let emailLabel = UILabel()
        let switchLabel = UILabel()
        let stepperLabel = UILabel()
        
        emailLabel.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        switchLabel.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        stepperLabel.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        emailLabel.text = email
        if let value = updateSwitch {
            switchLabel.text = value ? "업데이트 함" : "업데이트 안함"
        }
        if let value = intervalValue {
            stepperLabel.text = "\(Int(value))분마다"
        }
        
        view.addSubview(emailLabel)
        view.addSubview(switchLabel)
        view.addSubview(stepperLabel)
    }
}
