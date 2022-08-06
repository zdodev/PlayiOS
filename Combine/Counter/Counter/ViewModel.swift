//
//  ViewModel.swift
//  Counter
//
//  Created by Zero DotOne on 2022/08/06.
//

import Combine

final class ViewModel {
    enum Action {
        case addition
        case subtraction
    }
    
    struct Input {
        let tap: AnyPublisher<Action, Never>
    }
    
    struct Output {
        let count: AnyPublisher<Int, Never>
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private let countSubject = CurrentValueSubject<Int, Never>(0)
    
    func transform(input: Input) -> Output {
        Publishers.CombineLatest(input.tap, countSubject)
            .map(calculateCount)
            .assign(to: \.value, on: countSubject)
            .store(in: &cancellables)
        
        return Output(count: countSubject.eraseToAnyPublisher())
    }
    
    private func calculateCount(_ action: Action, _ value: Int) -> Int {
        switch action {
        case .addition:
            return value + 1
        case .subtraction:
            return value - 1
        }
    }
}
