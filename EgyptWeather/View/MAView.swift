//
//  MAView.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/6/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

@IBDesignable
class MAView: UIView {

    @IBInspectable var CornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = CornerRadius
            clipsToBounds = true
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
