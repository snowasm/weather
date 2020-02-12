//
//  NetworkLayer.swift
//  weatherTest
//
//  Created by Александр on 11.02.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import Foundation


class NetworkLayer {

    static func fetchData(city: String, completition: @escaping (_ weather: WeatherModel)->()) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=83d3002f1616bed06488e88a1933635d&units=metric&lang=ru"
        guard let url = URL(string: urlString) else { return }

        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            print(json)
            guard
                let jsonData = json as? [String: Any],
                let weatherDaily = WeatherModel(json: jsonData)
            else { return }
            completition(weatherDaily)
        }.resume()
        
    }
    
    
    
}
