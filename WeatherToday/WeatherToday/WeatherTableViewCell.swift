//
//  WeatherTableViewCell.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/29.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var rainfallLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
