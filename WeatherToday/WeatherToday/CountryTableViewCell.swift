//
//  CountryTableViewCell.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/09/06.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView?
    @IBOutlet weak var countryLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ country:Country){
        self.countryLabel?.text=country.koreanName
        self.flagImageView?.image = UIImage(named: "flag_\(country.assetName).jpg")
    }

}
