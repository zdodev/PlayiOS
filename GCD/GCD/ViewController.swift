//
//  ViewController.swift
//  GCD
//
//  Created by Zero DotOne on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.global(qos: .userInteractive).async {
//            print("We're on a global concurrent queue!")
//        }
//
//        DispatchQueue.global().async {
//            print("Generic global queue")
//        }
//
//        let serial = DispatchQueue(label: "com.besher.serial-queue.")
//        serial.async {
//            print("Private serial queue")
//        }
//
//        let concurrent = DispatchQueue(label: "zdo", attributes: .concurrent)
//        concurrent.async {
//            print("Private concurrent queue")
//        }
//
//        DispatchQueue.global().async {
//            print("Anonymous closure")
//        }
//
//        let item = DispatchWorkItem(qos: .utility) {
//            print("Work item to be executed later")
//        }
//        item.perform()
//
//        DispatchQueue.global().async {
//            for i in 0..<10 {
//                print(i)
//            }
//
//            for _ in 0..<10 {
//                print("?")
//            }
//
//            for _ in 0..<10 {
//                print("!")
//            }
//        }
//        DispatchQueue.global().async {
//            print("Inside")
//        }
//        print("Outside")
        
        let queue = DispatchQueue(label: "serial")
        let queue2 = DispatchQueue(label: "serial2", attributes: .concurrent)
        
        let task: (String, String) -> Void = { task, item in
            (1...3).forEach { (index) in
                print("\(task)", item, "Index: \(index)")
            }
        }
        
        DispatchQueue.global().sync {
            print("register 1")
            print("serial 1", Thread.current)
            Thread.sleep(forTimeInterval: 1)
            task("task 1", "🍕")
            task("task 1", "🍔")
        }
        print(":---:")
        
        DispatchQueue.global().sync {
            print("register 2")
            print("serial 2", Thread.current)
            Thread.sleep(forTimeInterval: 1)
            task("task 2", "🍕")
            task("task 2", "🍔")
        }
        print(":---:")
        
        DispatchQueue.global().sync {
            print("register 3")
            print("serial 3", Thread.current)
            Thread.sleep(forTimeInterval: 1)
            task("task 3", "🍕")
            task("task 3", "🍔")
        }
        print(":---:")
    }


}

