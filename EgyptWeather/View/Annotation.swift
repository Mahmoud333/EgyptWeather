//
//  Annotation.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/5/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    var title: String?
    var subtitle: String?
    var id: Int?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subTitle: String, id: Int) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subTitle
        self.id = id
    }
}
