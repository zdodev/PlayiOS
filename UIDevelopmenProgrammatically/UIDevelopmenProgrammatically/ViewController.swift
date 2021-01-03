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
        view.backgroundColor = .white
        
        // Button 생성
        let button = UIButton(type: .system)
        
        // Button 크기와 위치 설정
        button.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        
        // Button 중앙 위치 설정
        button.center = CGPoint(x: view.frame.size.width / 2, y: 100)
        
        // Button Title 설정
        button.setTitle("테스트 버튼", for: .normal)
        
        // 뷰에 버튼 추가
        view.addSubview(button)
        
        // Button 터치 이벤트 실행 메서드 설정
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    // Button 터치 이벤트 메서드 정의
    @objc func buttonPressed(_ sender: UIButton) {
        sender.setTitle("클릭되었습니다.", for: .normal)
    }
}

