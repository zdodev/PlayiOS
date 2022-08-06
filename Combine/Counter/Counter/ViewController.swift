//
//  ViewController.swift
//  Counter
//
//  Created by Zero DotOne on 2022/08/06.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    private let tapAction = PassthroughSubject<ViewModel.Action, Never>()
    private let viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        bind()
    }
    
    private func configureViews() {
        plusButton.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(tappedMinusButton), for: .touchUpInside)
    }
    
    private func bind() {
        let input = ViewModel.Input(tap: tapAction.eraseToAnyPublisher())
        
        let output = viewModel.transform(input: input)
        
        output.count
            .map { "\($0)" }
            .assign(to: \.text, on: countLabel)
            .store(in: &cancellables)
    }
    
    @objc private func tappedPlusButton() {
        tapAction.send(.addition)
    }
    
    @objc private func tappedMinusButton() {
        tapAction.send(.subtraction)
    }
}

