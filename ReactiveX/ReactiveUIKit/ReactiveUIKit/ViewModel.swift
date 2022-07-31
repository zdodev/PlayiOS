//
//  ViewModel.swift
//  ReactiveUIKit
//
//  Created by Zero DotOne on 2022/07/31.
//

import RxSwift
import RxRelay
import RxCocoa

final class ViewModel {
    enum Action {
        case plus
        case minus
    }
    
    struct Input {
        let tappedButton: Observable<Action>
    }
    
    struct Output {
        let text: Driver<Int>
        let isLoading: Driver<Bool>
    }
    
    struct State {
        let textRelay: BehaviorRelay<Int>
        let isLoadingRelay: BehaviorRelay<Bool>
    }
    
    private let state = State(
        textRelay: BehaviorRelay(value: 0),
        isLoadingRelay: BehaviorRelay(value: false)
    )
    private let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let state = state
        
        input.tappedButton
            .do(onNext: { _ in state.isLoadingRelay.accept(true) })
            .map(calculateTextValue)
            .delay(.milliseconds(500), scheduler: MainScheduler.instance)
            .do(onNext: { _ in state.isLoadingRelay.accept(false) })
            .bind(to: state.textRelay)
            .disposed(by: disposeBag)
        
        return Output(
            text: state.textRelay.asDriver(),
            isLoading: state.isLoadingRelay.asDriver()
        )
    }
    
    private func calculateTextValue(_ action: Action) -> Int {
        action == .plus ? state.textRelay.value + 1 : state.textRelay.value - 1
    }
}
