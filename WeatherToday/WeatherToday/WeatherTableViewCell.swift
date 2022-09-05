//
//  WeatherTableViewCell.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/29.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var rainfallLabel: UILabel!
    
    var weatherImages: [String] = ["rainy", "snowy", "sunny","cloudy"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(_ cityWeather: CityWeather){
        self.cityLabel?.text = cityWeather.cityName
        self.stateLabel?.text = "섭씨 : \(cityWeather.state)도 / 화씨 \(cityWeather.celsius)도"
        self.rainfallLabel?.text = "강수 확률 :\(cityWeather.rainfallProbability)%"
        self.loadingImage(Float(cityWeather.state), cityWeather.rainfallProbability)
        setTextColor(Float(cityWeather.state), cityWeather.rainfallProbability)
    }
    
    func setTextColor(_ state: Float, _ rain: Int){
        
        if state<=10{
            self.stateLabel.textColor = UIColor.blue
        }
        enum RainState: Int{
            case clean = 0
            case little = 30
            case heavy = 60
        }
        if rain>=70 {
            self.rainfallLabel.textColor = UIColor.orange
        }
        
    }
    
    //날씨별 이미지
    func loadingImage(_ state: Float, _ rain: Int) {

        if rain >= 60 {
            if state>10{
                self.weatherImageView?.image = UIImage(named: "\(weatherImages[2]).jpg")
            }
            else{
                self.weatherImageView?.image = UIImage(named: "\(weatherImages[1]).jpg")
            }
        }
        else if rain>=30{
            self.weatherImageView?.image = UIImage(named: "\(weatherImages[3]).jpg")
        }
        else{
            self.weatherImageView?.image = UIImage(named: "\(weatherImages[0]).jpg")
        }
    }

    
}
