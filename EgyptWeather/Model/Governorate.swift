//
//  Governorate.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/5/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import Foundation

class Governorate {
    
    var name: String!
    var latitude: Double!
    var longitude: Double!
    var id: Int!
    var weather: Weather?
    
    init(name: String,latitude: Double,longitude: Double, id: Int) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.id = id
    }
    
}


