//
//  WeatherPopUp.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/6/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class WeatherPopUp: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var miniTempLbl: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var windDegreeLbl: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    
    func setUpUI() {
        if weather != nil {
            
            imageV.image = UIImage(named: weather!.main ?? "")
            cityLbl.text = weather!.CityName ?? ""
            miniTempLbl.text = "\(weather!.minTempCelsius!)°"
            maxTemp.text = "\(weather!.maxTempCelsius!)°"
            currentTemp.text = "\(weather!.currentTempCelsius!)°"
            
            descLbl.text = "\(weather!.weatherDesc!)"
            humidityLbl.text = "\(weather!.humidity!)%"
            pressureLbl.text = "\(weather!.pressure!) hPA"
            windSpeedLbl.text = "\(weather!.windSpeed!)"
            windDegreeLbl.text = "\(weather!.windDegree!)"
        }
        
        mainView.layer.cornerRadius = 20
        //secondView.layer.cornerRadius = 12
    }
    
    
    @IBAction func dissmissTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
