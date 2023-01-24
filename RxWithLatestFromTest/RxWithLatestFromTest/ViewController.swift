//
//  ViewController.swift
//  RxWithLatestFromTest
//
//  Created by 곽재선 on 2023/01/16.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    let viewModel: ViewModel
    var disposeBag = DisposeBag()

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rxButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        viewModel = ViewModel()
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    func bindUI() {
        
//        let printText = PublishSubject<String>()
        
//        viewModel.showText
//            .debug()
//            .bind(to: textLabel.rx.text)
//            .disposed(by: disposeBag)
//
//        rxButton.rx.tap
//            .debug()
//            .bind(to: viewModel.tapButton)
//            .disposed(by: disposeBag)
        
//        rxButton.rx.tap.withLatestFrom(printText)
//            .subscribe(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
        
//        printText.onNext("5")
//        printText.onNext("10")
        
        rxButton.rx.tap
            .bind(to: viewModel.buttonTapped)
            .disposed(by: disposeBag)
        
        viewModel.showText
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)
        
        textField.rx.text.orEmpty
            .bind(to: textLabel.rx.text)
            .disposed(by: disposeBag)
        
        
    }


}

