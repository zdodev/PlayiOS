//
//  ViewController.swift
//  UserNotificationTutorial
//
//  Created by admin on 2021/12/24.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 현재 등록 토큰 가져오기
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }
    }
}

