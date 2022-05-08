//
//  WebViewController.swift
//  BMICalc
//
//  Created by 곽재선 on 2022/05/08.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goNaver(_ sender: UIButton) {
        guard let url = URL(string: "https://m.naver.com") else { return }
        let request = URLRequest(url: url)
        self.webView?.load(request)
    }
}
