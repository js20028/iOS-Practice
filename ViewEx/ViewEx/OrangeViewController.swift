//
//  OrangeViewController.swift
//  ViewEx
//
//  Created by 곽재선 on 2022/04/26.
//

import UIKit

class OrangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func dismissOrange(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
