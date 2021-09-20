import UIKit
import RxSwift

class ViewController2: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var disposeBag = DisposeBag()
    
    @IBAction func exJust1(_ sender: UIButton)  {
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
    
    @IBAction func exJust2(_ sender: UIButton)  {
        Observable.just(["Hello", "World"])
            .subscribe(onNext: { str in
                print(str)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func exFrom1(_ sender: UIButton)  {
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
    
    @IBAction func exMap3(_ sender: UIButton) {
        Observable.just("800x600")
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .map { $0.replacingOccurrences(of: "x", with: "/") }
            .map { "https://picsum.photos/\($0)/?random" }
            .map { URL(string: $0) }
            .filter { $0 != nil }
            .map { $0! }
            .map { try Data(contentsOf: $0) }
            .map { UIImage(data:  $0) }
            .do(onNext: { image in
                print(image?.size)
            })
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { image in
                self.imageView.image = image
            })
            .disposed(by: disposeBag)
    }
}
