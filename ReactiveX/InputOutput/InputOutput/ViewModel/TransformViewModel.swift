import RxSwift
import RxCocoa

protocol TransformViewModelType: ViewModelType {
    func transform(input: Input) -> Output
}

struct TransformViewModel: TransformViewModelType {
    struct Input {
        let decreaseAction: ControlEvent<Void>
        let increaseAction: ControlEvent<Void>
    }
    
    struct Output {
        let countedValue: Driver<Int>
    }
    
    private let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let countedValue = BehaviorRelay(value: 0)
        
        input.decreaseAction
            .subscribe(onNext: {
                countedValue.accept(countedValue.value - 1)
            })
            .disposed(by: disposeBag)
        
        input.increaseAction
            .subscribe(onNext: {
                countedValue.accept(countedValue.value + 1)
            })
            .disposed(by: disposeBag)
        
        return Output(countedValue: countedValue.asDriver(onErrorJustReturn: 0))
    }
}
