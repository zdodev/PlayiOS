//
//  ViewController.swift
//  UIDevelopmenProgrammatically
//
//  Created by Zero DotOne on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {
    var navigationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        
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
        
        navigationButton = UIButton(type: .system)
        view.addSubview(navigationButton)
        navigationButton.setTitle("Go To Nav Controller", for: .normal)
        navigationButton.backgroundColor = .white
        navigationButton.setTitleColor(.black, for: .normal)
        navigationButton.frame = CGRect(x: 100, y: 200, width: 200, height: 52)
        navigationButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        title = "ee"
    }
    
    // Button 터치 이벤트 메서드 정의
    @objc private func buttonPressed(_ sender: UIButton) {
        sender.setTitle("클릭되었습니다.", for: .normal)
    }
    
    @objc private func didTapButton() {
        let rootVC = SecondViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
