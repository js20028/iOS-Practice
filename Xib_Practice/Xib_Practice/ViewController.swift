//
//  ViewController.swift
//  Xib_Practice
//
//  Created by 곽재선 on 2022/05/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myCustomView = MyCustomView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
//        view.addSubview(myCustomView)
        
        let weatherView = WeatherView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        weatherView.setupTableView()
        view.addSubview(weatherView)
        
//        guard let weatherView = Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)?.first as? WeatherView else { return }
//        weatherView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//        self.view.addSubview(weatherView)
        
    }
}

