import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    private var count = 0
    private let largestImageURL = "https://picsum.photos/2560/1440/?random"
    private var disposeBag = DisposeBag()
    private var publishSubject = PublishSubject<[String]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.count += 1
            self.countLabel.text = "\(self.count)"
        }
        
        _ = loadImageWithRxSwift(from: largestImageURL)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                switch result {
                case let .next(image):
                    self.imageView.image = image
                case let .error(error):
                    print(error)
                case .completed:
                    print("Completed")
                }
            }
            .disposed(by: disposeBag)
        
        publishSubject
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .subscribe(onNext: { element in
                print(element)
            }, onError: { error in
                print("error: \(error)")
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func onLoad(_ sender: UIButton) {
        imageView.image = nil
        
        loadImageWithRxSwift(from: largestImageURL)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                switch result {
                case let .next(image):
                    self.imageView.image = image
                case let .error(error):
                    print(error)
                case .completed:
                    print("Completed")
                }
            }
            .disposed(by: disposeBag)
        // disposeBag.insert(disposable)
    }
    
    @IBAction func onCancel(_ sender: UIButton) {
        // disposable?.dispose()
        disposeBag = DisposeBag()
    }
    
    private func loadImageWithRxSwift(from imageURL: String) -> Observable<UIImage?> {
        Observable.create { observer in
            self.loadImageAsynchronously(from: imageURL) { image in
                observer.onNext(image)
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    private func loadImageAsynchronously(from imageURL: String, completionHandler: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: self.largestImageURL) else {
                completionHandler(nil)
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completionHandler(nil)
                return
            }
            
            let image = UIImage(data: data)
            completionHandler(image)
        }
    }
    
    @IBAction func tappedSubject(_ sender: UIButton) {
        publishSubject
            .onNext(["abc", "def", "ghi"])
    }
    
    @IBAction func tappedObservable(_ sender: UIButton) {
        Observable.from([1, 2, 3])
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
    }
}
