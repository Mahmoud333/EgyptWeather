//
//  WeatherService.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/6/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Alamofire
import SwiftyJSON


class WeatherService {
    
    static var instance = WeatherService()
    
    func getWeather(lat: Double, long: Double, completion: @escaping (Bool, Weather?)-> ()) {
        
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)\(API_UNITS)\(API_KEY)"

        print(url)
        Alamofire.request(url).responseData { (response) in
            
            if response.error != nil {
                debugPrint("error: \(response.error?.localizedDescription)")
                completion(false, nil)
                return
            }
            
            let json = JSON(response.data)
            
            var weather = Weather()
            weather.CityName = json["name"].stringValue.capitalized
            weather.currentTempCelsius = json["main"]["temp"].intValue
            weather.humidity = json["main"]["humidity"].intValue
            weather.maxTempCelsius = json["main"]["temp_max"].intValue
            weather.minTempCelsius = json["main"]["temp_min"].intValue
            
            weather.pressure = json["main"]["pressure"].floatValue
            weather.weatherDesc = json["weather"][0]["description"].stringValue.capitalized
            weather.main = json["weather"][0]["main"].stringValue.capitalized

            weather.windDegree = json["wind"]["speed"].floatValue
            weather.windSpeed = json["wind"]["deg"].floatValue
            print(weather.CityName)
            completion(true, weather)
        }
    }
}
