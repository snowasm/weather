//
//  ViewController.swift
//  weatherTest
//
//  Created by Александр on 11.02.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var currentWeather: WeatherModel?
    
    private func updateView() {
        cityNameLabel.text = currentWeather?.city?.name
        currentTemp.text = "\((currentWeather?.list?[0].temperature)!)º"
        weatherDescription.text = currentWeather?.list?[0].weather
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        NetworkLayer.fetchData(city: "Morozovsk") { (weather) in
            self.currentWeather = weather
            DispatchQueue.main.async {
                self.updateView()
                self.tableView.reloadData()
            }
        }
    }

}


extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWeather?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Температура \((currentWeather?.list?[indexPath.row].dtString)!): \((currentWeather?.list?[indexPath.row].temperature)!)"
        return cell
    }
    
    
}
