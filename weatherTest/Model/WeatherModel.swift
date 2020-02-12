//
//  WeatherModel.swift
//  weatherTest
//
//  Created by Александр on 11.02.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

struct WeatherModel {

    let city: City?
    let list: Array<DayWeather>?
        
    init?(json: [String: Any]) {
        guard let city = json["city"] as? [String: Any] else { return nil }
        self.city = City(city: city)
        
        guard let list = json["list"] as? Array<[String: Any]> else { return nil }
        var days = [DayWeather]()
        for day in list {
            if let dayTmp = DayWeather(day: day) {
                days.append(dayTmp)
            }
        }
        self.list = days
    }
    
}
