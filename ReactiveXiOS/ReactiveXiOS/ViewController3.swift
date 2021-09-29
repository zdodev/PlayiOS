import UIKit
import RxSwift

class ViewController3:
    UIViewController {
    var observable = Observable<Int>.create { observer in
        observer.onNext(Int.random(in: 1...100))
        observer.onCompleted()
        return Disposables.create()
    }
    var subject = PublishSubject<Int>()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tappedObservable(_ sender: UIButton) {
        observable
            .subscribe(onNext: { element in
                print(element)
            }, onCompleted: {
                print("completed")
            })
            .disposed(by: disposeBag)
        
        observable
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func tappedSubscribe(_ sender: UIButton) {
        subject
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
        print("subject.subscribe")
    }
    
    @IBAction func tappedOnNext(_ sender: UIButton) {
        subject.onNext(1)
    }
}
