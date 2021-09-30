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
    
    let passthroughSubject = PassthroughSubject<String, Error>()
    let currentValueSubject = CurrentValueSubject<Bool, Error>(true)
    
    var anyCancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passthroughSubject
            .sink { completion in
                switch completion {
                case .failure:
                    print("error")
                case .finished:
                    print("finished")
                }
            } receiveValue: { value in
                print(value)
            }
            .store(in: &anyCancellable)
        
        currentValueSubject
            .sink { completion in
                switch completion {
                case .failure:
                    print("error")
                case .finished:
                    print("finished")
                }
            } receiveValue: { value in
                print(value)
            }
            .store(in: &anyCancellable)

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
    
    @IBAction func tappedJust(_ sender: UIButton) {
        let publisher = Just(1)
        publisher
            .sink { element in
                print(element)
            }
            .store(in: &anyCancellable)
    }
    
    @IBAction func tappedPublisher(_ sender: UIButton) {
        let publisher = (1...10).publisher
        publisher.sink { _ in
            print("complete")
        } receiveValue: { element in
            print(element)
        }
        .store(in: &anyCancellable)
    }
    
    @IBAction func CustomPublisher(_ sender: UIButton) {
        let publisher = ["A", "B", "C"].publisher
        let subscriber1 = CustomSubscriber()
        publisher
            .subscribe(subscriber1)
    }
    
    @IBAction func tappedPassthroughSubject(_ sender: UIButton) {
        passthroughSubject
            .send("pass.")
        
        passthroughSubject
            .send(completion: .finished)
    }
    
    @IBAction func tappedCurrentValueSubject(_ sender: UIButton) {
        currentValueSubject
            .send(false)
        
        currentValueSubject
            .send(completion: .finished)
    }
    
    @IBAction func tappedNetwork(_ sender: UIButton) {
        struct Post: Decodable {
            let id: Int
            let title: String
            let body: String
            let userId: Int
        }
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {
                print($0.data)
                return $0.data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .sink { _ in
                print("종료")
            } receiveValue: { values in
                print(values.count)
            }
            .store(in: &anyCancellable)

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
