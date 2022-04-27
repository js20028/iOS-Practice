//
//  ViewController.swift
//  Nav
//
//  Created by 곽재선 on 2022/04/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goRed(_ sender: UIButton) {
        guard let redVC = storyboard?.instantiateViewController(identifier: "RedVC") else { return }
        navigationController?.pushViewController(redVC, animated: true)
    }
    
}

