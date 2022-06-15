//
//  MyView.swift
//  Xib_Practice
//
//  Created by 곽재선 on 2022/05/31.
//

import UIKit

@IBDesignable
class MyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xipSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xipSetup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    func xipSetup() {
        guard let view = loadViewFromXib(nib: "MyView") else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    func loadViewFromXib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    


}
