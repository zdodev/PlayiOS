//
//  ViewController.swift
//  ReactiveUIKit
//
//  Created by Zero DotOne on 2022/07/31.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        bind()
    }
    
    private func bind() {
        let input = ViewModel.Input(
            tappedButton: Observable.merge(
                minusButton.rx.tap.map { ViewModel.Action.minus },
                plusButton.rx.tap.map { ViewModel.Action.plus }
            )
        )
        
        let output = viewModel.transform(input: input)
        
        output.text
            .map { "\($0)" }
            .drive(textLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.isLoading
            .drive(activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}

