//
//  WeatherTableViewCell.swift
//  Xib_Practice
//
//  Created by 곽재선 on 2022/06/12.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIamge: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.weatherIamge.image = UIImage(systemName: "cloud.fill")
        self.weatherLabel.text = "1"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
