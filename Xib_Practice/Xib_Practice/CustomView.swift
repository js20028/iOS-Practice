//
//  CustomView.swift
//  Xib_Practice
//
//  Created by 곽재선 on 2022/05/30.
//

import UIKit

class CustomView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
    
    private func loadView() {
   //     let identifier = String(describing: type(of: self))
        let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        guard let customView = view?.first as? UIView else { return }
        
        customView.frame = self.bounds
        self.addSubview(customView)
    }
}
