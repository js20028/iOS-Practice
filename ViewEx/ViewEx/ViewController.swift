//
//  ViewController.swift
//  ViewEx
//
//  Created by 곽재선 on 2022/04/26.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goOrange(_ sender: UIButton) {
        let orangeVC = storyboard?.instantiateViewController(withIdentifier: "OrangeVC")
        orangeVC?.modalPresentationStyle = .fullScreen
        orangeVC?.modalTransitionStyle = .coverVertical
        present(orangeVC!, animated: true, completion: nil)
    }

}

