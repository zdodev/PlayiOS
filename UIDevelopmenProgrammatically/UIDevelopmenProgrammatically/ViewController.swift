//
//  ViewController.swift
//  UIDevelopmenProgrammatically
//
//  Created by Zero DotOne on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        
        let rect1 = CGRect(x: 10, y: 100, width: 100, height: 100)
        let firstView = UIView(frame: rect1)
        firstView.backgroundColor = .cyan
        view.addSubview(firstView)
        
        let rect2 = CGRect(x: 10, y: 10, width: 150, height: 150)
        let secondView = UIView(frame: rect2)
        secondView.backgroundColor = .black
//        firstView.addSubview(secondView)
        view.insertSubview(secondView, aboveSubview: firstView)
        
        print("ee")
    }
}
