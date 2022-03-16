//
//  ViewController.swift
//  LEDBoard
//
//  Created by 곽재선 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {
    @IBOutlet weak var contenstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contenstLabel.textColor = .yellow
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contenstLabel.text
            settingViewController.textColor = self.contenstLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contenstLabel.text = text
            self.contenstLabel.textColor = textColor
            self.view.backgroundColor = backgroundColor
        }
    }


}

