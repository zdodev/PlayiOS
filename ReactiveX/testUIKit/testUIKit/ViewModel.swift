import RxSwift
import RxRelay

struct ViewModel {
    struct Input {
        let tapMinus: Observable<Void>
        let tapPlus: Observable<Void>
    }
    
    struct State {
        let count: BehaviorRelay<Int>
        let isLoading: BehaviorRelay<Bool>
    }
    
    struct Output {
        let count: Observable<Int>
        let isLoading: Observable<Bool>
    }
    
    private let disposeBag = DisposeBag()
    
    private let state = State(
        count: BehaviorRelay(value: 0),
        isLoading: BehaviorRelay(value: false)
    )
    
    func transform(input: Input) -> Output {
        input.tapMinus
            .do(onNext: { _ in state.isLoading.accept(true)})
            .map { state.count.value }
            .map { $0 - 1 }
            .delay(.seconds(1), scheduler: MainScheduler.instance)
            .do(onNext: { _ in state.isLoading.accept(false)})
            .bind(to: state.count)
            .disposed(by: disposeBag)
        input.tapPlus
            .do(onNext: { _ in state.isLoading.accept(true) })
            .map { state.count.value }
            .map { $0 + 1 }
            .delay(.seconds(1), scheduler: MainScheduler.instance)
            .do(onNext: { _ in state.isLoading.accept(false) })
            .bind(to: state.count)
            .disposed(by: disposeBag)
        
        return Output(
            count: state.count.asObservable(),
            isLoading: state.isLoading.asObservable()
        )
    }
}
