//
//  City.swift
//  weatherTest
//
//  Created by Александр on 11.02.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation
struct City {
    
    let coords: [String: Double]?
    let country: String?
    let id: Int?
    let name: String?
    let population: Int?
    let sunrise: String?
    let sunset: String?
    let timezone: Int?
    
    init?(city: [String: Any]) {
        self.coords = city["coord"] as? [String: Double]
        self.country = city["country"] as? String
        self.id = city["id"] as? Int
        self.name = city["name"] as? String
        self.population = city["population"] as? Int
        let tmpRise = city["sunrise"] as? Int
        self.sunrise = Date(timeIntervalSince1970: Double(tmpRise!)).description
        let tmpSet = city["sunset"] as? Int
        self.sunset = Date(timeIntervalSince1970: Double(tmpSet!)).description
        self.timezone = city["timezone"] as? Int        
    }
     
}
