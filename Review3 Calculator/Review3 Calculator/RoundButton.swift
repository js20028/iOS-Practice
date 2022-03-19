//
//  RoundButton.swift
//  Review3 Calculator
//
//  Created by 곽재선 on 2022/03/18.
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
