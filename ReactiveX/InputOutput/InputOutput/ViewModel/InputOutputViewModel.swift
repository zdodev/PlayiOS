import RxSwift
import RxCocoa

protocol InputOutputViewModelType: ViewModelType {
    var input: Input { get }
    var output: Output { get }
}

struct InputOutputViewModel: InputOutputViewModelType {
    struct Input {
        let decreaseAction: ControlEvent<Void>
        let increaseAction: ControlEvent<Void>
    }
    
    struct Output {
        let countedValue: Driver<Int>
    }
    
    private let disposeBag = DisposeBag()
    
    let input: Input
    let output: Output

    init() {
        let a = BehaviorSubject<Void>(value: ())
        input = Input(decreaseAction: a.asObserver(), increaseAction: a.asObserver())
    }
}
