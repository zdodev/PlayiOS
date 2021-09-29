import UIKit
import Combine
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
    
    var anyCancellable = Set<AnyCancellable>()
    
    @IBAction func tappedJust(_ sender: UIButton) {
//        let publisher = Just(1)
//        publisher
//            .sink { element in
//                print(element)
//            }
//            .store(in: &anyCancellable)
        
//        let publisher = (1...10).publisher
//        publisher.sink { _ in
//            print("complete")
//        } receiveValue: { element in
//            print(element)
//        }
//        .store(in: &anyCancellable)
        
        let publisher = ["A", "B", "C"].publisher
        let subscriber1 = CustomSubscriber()
        publisher
            .subscribe(subscriber1)
    }
    
    
}

class CustomSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("데이터의 구독을 시작합니다.")
        subscription.request(.unlimited)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("데이터를 받았습니다.", input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("모든 데이터의 발행이 완료되었습니다.")
    }
}
