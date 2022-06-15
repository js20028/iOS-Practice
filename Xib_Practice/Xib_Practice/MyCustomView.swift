//
//  MyCustomView.swift
//  Xib_Practice
//
//  Created by 곽재선 on 2022/06/06.
//

import UIKit

class MyCustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
    }
    
    // 방법 1. loadNibNamed
    func customInit() {
        if let view = Bundle.main.loadNibNamed("MyCustomView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    // 방법 2. UINib 생성 후 instantiate
    func alternativeCustomInit() {
        if let view = UINib(nibName: "MyCustomView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    

}
