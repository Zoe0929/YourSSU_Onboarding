//
//  De.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/29.
//

import Foundation

struct De: Codable {
    var cityName: String
    var state: Int
    var celsius: Double
    var rainfallProbability: Int
    
    enum CodingKeys: String,CodingKey {
        case state
        case celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}

