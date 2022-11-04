//
//  ViewController.swift
//  testUIKit
//
//  Created by Zero DotOne on 2022/11/04.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = ViewModel.Input(
            tapMinus: minusButton.rx.tap.asObservable(),
            tapPlus: plusButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(input: input)
        
        output.count
            .map { "\($0)"}
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.isLoading
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
    
    deinit {
        print("deinit!")
    }
}

