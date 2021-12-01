//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class lateData<T> {
    private let task: (@escaping (T) -> Void) -> Void
    
    init(task: @escaping (@escaping (T) -> Void) -> Void) {
        self.task = task
    }
    
    func lateCome(_ f: @escaping (T) -> Void) {
        task(f)
    }
}

/*
class Observable<T> {
    private let task: (@escaping (T) -> Void) -> Void
    
    init(task: @escaping (@escaping (T) -> Void) -> Void) {
        self.task = task
    }
    
    func subscribe(_ f: @escaping (T) -> Void) {
        task(f)
    }
}
 */

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }
    
    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }
    
    // 비동기 처리를 리턴 값 형태로 처리하는 유틸리티, 라이브러리
    // PromiseKit
    // Bolt
    // RxSwift -> 비동적으로 생기는 데이터를 리턴 값으로 전달하기 위해서 만들어진 라이브러리
    
    // 나중에 생기는 데이터<T> > Observable<T> { ... }
    // 나중에 오면은 > .subscribe() { ... }
    
    // 데이터를 요청하고 오는 과정을 정의한(클로저) 로직 순서를 반환
    
    // Observable의 생명주기
    // 1. Create
    // 2. Subscribe
    // 3. onNext
    // 4. onCompleted, onError
    // 5. Disposed
    
    func downloadJSON(_ url: String) -> Observable<String> {
        // 1. 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
        // 2. Observable을 생성(create)
        Observable.create { observer in
            let url = URL(string: url)!
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil else {
                    observer.onError(error!)
                    return
                }
                
                if let data = data, let json = String(data: data, encoding: .utf8) {
                    observer.onNext(json)
                }
                
                observer.onCompleted()
            }
            
            task.resume()
            
            // dispose 시 취소 작업 정의
            return Disposables.create {
                task.cancel()
            }
        }
        
//        return Observable.create() { f in
//            DispatchQueue.global().async {
//                let url = URL(string: url)!
//                let data = try! Data(contentsOf: url)
//                let json = String(data: data, encoding: .utf8)
//
//                DispatchQueue.main.async {
//                    f.onNext(json)
//                }
//            }
//
//            return Disposables.create()
//        }
    }
    
    // MARK: SYNC
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func onLoad() {
        editView.text = ""
        setVisibleWithAnimation(activityIndicator, true)
        
        // 2. Observable로 오는 데이터를 받아서 처리하는 방법
        let jsonObservable = downloadJSON(MEMBER_LIST_URL)
        let helloObservable = Observable.just("Hello World")
        Observable.zip(jsonObservable, helloObservable) { $1 + "\n" + $0 }
            // Operator의 존재
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { value in
                self.editView.text = value.description
                self.setVisibleWithAnimation(self.activityIndicator, false)
            })
    }
}
