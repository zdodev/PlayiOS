import UIKit
import RxSwift

class ViewController2: UIViewController {
    var disposeBag = DisposeBag()
    
    @IBAction func exJust1(_ sender: UIButton) {
        Observable.just("Hello world")
            .subscribe { event in
                switch event {
                case .next(let str):
                    print(str)
                case .error(let error):
                    print(error.localizedDescription)
                case .completed:
                    print("completed")
                }
            }
            .disposed(by: disposeBag)
    }
    
    @IBAction func exJust2(_ sender: UIButton) {
        Observable.just(["Hello", "World"])
            .subscribe(onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func exFrom1(_ sender: UIButton) {
        Observable.from(["RxSwift", "In", "4", "Hours"])
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func exMap1(_ sender: UIButton) {
        Observable.just("Hello")
            .map { str in
                "\(str) RxSwift"
            }
            .subscribe(onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func exMap2(_ sender: UIButton) {
        Observable.from(["blue", "white"])
            .map { str in
                 str.count
            }
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func exFilter(_ sender: UIButton) {
        Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
            .filter { element in
                element % 2 == 0
            }
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
    }
    
    
    
}
