//
//  ViewModel.swift
//  Counter
//
//  Created by admin on 2022/06/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

final class CounterViewModel: ViewModel {
    struct Input {
        let increaseButtonTap: ControlEvent<Void>
        let decreaseButtonTap: ControlEvent<Void>
    }
    
    struct Output {
        let countNumber: Driver<Int>
    }
    
    private let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let countedValue = BehaviorSubject(value: 0)
        
        input.increaseButtonTap
//            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .map({ a in
                print(a)
            })
            .subscribe(onNext: {
                countedValue.onNext(try! countedValue.value() + 1)
            })
            .disposed(by: disposeBag)
        input.decreaseButtonTap
            .subscribe(onNext: {
                countedValue.onNext(try! countedValue.value() - 1)
            })
            .disposed(by: disposeBag)
        
        return Output(countNumber: countedValue.asDriver(onErrorJustReturn: 0))
    }
}
