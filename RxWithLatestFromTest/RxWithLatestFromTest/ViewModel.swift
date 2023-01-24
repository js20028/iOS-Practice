//
//  ViewModel.swift
//  RxWithLatestFromTest
//
//  Created by 곽재선 on 2023/01/16.
//

import Foundation
import RxSwift

class ViewModel {
    
    let tapButton: AnyObserver<Void>
//    let textObserver: PublishSubject<Void>
    let showText: Observable<String>
    
    let buttonTapped: PublishSubject<Void>
    
    let textValue: BehaviorSubject<String>
    
    
    init() {
        buttonTapped = PublishSubject()
        textValue = BehaviorSubject(value: "10")
        
        let showing = PublishSubject<Void>()
        
        let tx = BehaviorSubject<String>(value: "1")
        
        tapButton = showing.asObserver()
        
//        showText = showing.withLatestFrom(tx)
        
        showText = buttonTapped.withLatestFrom(textValue)
        
        
        
    }
}
