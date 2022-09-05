//
//  CityWeather.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/29.
//

import Foundation

struct CityWeather: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String,CodingKey {
        case state
        case celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}

