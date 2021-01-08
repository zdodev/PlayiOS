//
//  ViewController.swift
//  UIDevelopmenProgrammatically
//
//  Created by Zero DotOne on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {
    var navigationButton: UIButton!
    var emailTextField: UITextField!
    var updateSwitch: UISwitch!
    var intervalStepper: UIStepper!
    var intervalValueLabel: UILabel!
    var updateSwitchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
//
//        // Button 생성
//        let button = UIButton(type: .system)
//
//        // Button 크기와 위치 설정
//        button.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
//
//        // Button 중앙 위치 설정
//        button.center = CGPoint(x: view.frame.size.width / 2, y: 100)
//
//        // Button Title 설정
//        button.setTitle("테스트 버튼", for: .normal)
//
//        // 뷰에 버튼 추가
//        view.addSubview(button)
//
//        // Button 터치 이벤트 실행 메서드 설정
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//
//        navigationButton = UIButton(type: .system)
//        view.addSubview(navigationButton)
//        navigationButton.setTitle("Go To Nav Controller", for: .normal)
//        navigationButton.backgroundColor = .white
//        navigationButton.setTitleColor(.black, for: .normal)
//        navigationButton.frame = CGRect(x: 100, y: 200, width: 200, height: 52)
//        navigationButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        title = "ee"
        
        navigationItem.title = "설정"
        
        let emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        emailLabel.text = "이메일"
        emailLabel.font = .systemFont(ofSize: 14)
        view.addSubview(emailLabel)
        
        let updateLabel = UILabel()
        updateLabel.frame = CGRect(x: emailLabel.frame.origin.x, y: 150, width: 100, height: 30)
        updateLabel.text = "자동갱신"
        updateLabel.font = .systemFont(ofSize: 14)
        view.addSubview(updateLabel)
        
        let intervalLabel = UILabel()
        intervalLabel.frame = CGRect(x: emailLabel.frame.origin.x, y: 200, width: 100, height: 30)
        intervalLabel.text = "갱신주기"
        intervalLabel.font = .systemFont(ofSize: 14)
        view.addSubview(intervalLabel)
        
        emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        emailTextField.font = .systemFont(ofSize: 13)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        updateSwitch = UISwitch()
        updateSwitch.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        updateSwitch.setOn(true, animated: true)
        view.addSubview(updateSwitch)
        
        intervalStepper = UIStepper()
        intervalStepper.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        intervalStepper.minimumValue = 0
        intervalStepper.maximumValue = 100
        intervalStepper.stepValue = 1
        intervalStepper.value = 0
        view.addSubview(intervalStepper)
        
        intervalValueLabel = UILabel()
        intervalValueLabel.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        intervalValueLabel.font = .systemFont(ofSize: 12)
        intervalValueLabel.textColor = .systemRed
        intervalValueLabel.text = "0분마다"
        view.addSubview(intervalValueLabel)
        
        updateSwitchLabel = UILabel()
        updateSwitchLabel.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        updateSwitchLabel.font = .systemFont(ofSize: 12)
        updateSwitchLabel.textColor = .systemRed
        updateSwitchLabel.text = "갱신함"
        view.addSubview(updateSwitchLabel)
        
        updateSwitch.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        intervalStepper.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        emailTextField.autocapitalizationType = .none
        
        let submitButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        navigationItem.rightBarButtonItem = submitButton
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
    
    @objc private func presentUpdateValue(_ sender: UISwitch) {
        updateSwitchLabel.text = (sender.isOn ? "갱신함" : "갱신하지 않음")
    }
    
    @objc private func presentIntervalValue(_ sender: UIStepper) {
        intervalValueLabel.text = "\(Int(sender.value))분마다"
    }
    
    @objc private func submit(_ sender: Any) {
        let rvc = ReadViewContoller()
        rvc.email = emailTextField.text
        rvc.updateSwitch = updateSwitch.isOn
        rvc.intervalValue = intervalStepper.value
        navigationController?.pushViewController(rvc, animated: true)
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
