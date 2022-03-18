//
//  RoundButton.swift
//  Calculator
//
//  Created by 곽재선 on 2022/01/19.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }


}
