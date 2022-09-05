//
//  Country.swift
//  WeatherToday
//
//  Created by 지희의 MAC on 2022/08/23.
//

import Foundation


struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String,CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
