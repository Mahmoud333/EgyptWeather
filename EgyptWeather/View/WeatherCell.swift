//
//  WeatherCell.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/7/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var windDegreeLbl: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuerCell(weather: Weather) {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 12
        
        cityLbl.text = weather.CityName
        currentTemp.text = "\(weather.currentTempCelsius!)°"
        humidityLbl.text = "\(weather.humidity!)%"
        windSpeedLbl.text = "\(weather.windSpeed!)"
        windDegreeLbl.text = "\(weather.windDegree!)"
    }

}
