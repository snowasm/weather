//
//  DayWeather.swift
//  weatherTest
//
//  Created by Александр on 11.02.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation

struct DayWeather {
 
    let clouds: Int?
    let dt: Int?
    let dtString: String?
    let wind: [String: Double]?
    let feelLike: Int?
    let pressure: Int?
    let temperature: Int?
    let weather: String?
    
    init?(day: [String: Any]) {
        let cloudTmp = day["clouds"] as? [String: Any]
        self.clouds = cloudTmp?["all"] as? Int
        self.dt = day["dt"] as? Int
        self.dtString = day["dt_txt"] as? String
        self.wind = day["wind"] as? [String: Double]
        let mainTmp = day["main"] as? [String: Any]
        let feelsTmp = mainTmp?["feels_like"] as? NSNumber
        self.feelLike = feelsTmp?.intValue
        self.pressure = mainTmp?["pressure"] as? Int
        let currentTmp = mainTmp?["temp"] as? NSNumber
        self.temperature = currentTmp?.intValue
        let weatherTmp = day["weather"] as? [[String: Any]]
        self.weather = weatherTmp?[0]["description"] as? String
        print()
    }
    
}
