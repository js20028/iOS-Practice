//
//  WeatherView.swift
//  Xib_Practice
//
//  Created by 곽재선 on 2022/06/02.
//

import UIKit

class WeatherView: UIView, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weeklyTableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        return cell
    }
    

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherInfoLabel: UILabel!
    @IBOutlet weak var weeklyTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    func setupTableView() {
        self.weeklyTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "WeatherCell")
        self.weeklyTableView.dataSource = self
    }
}
