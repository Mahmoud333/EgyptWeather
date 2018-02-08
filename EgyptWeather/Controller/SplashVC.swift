//
//  SplashVC.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/7/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet weak var EarthIV: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loggedINAnimation()
    }
    
    func loggedINAnimation() {
        
        
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: {
            
            //self.EarthIV.frame.size = CGSize(width: self.view.frame.width*2.0, height: self.view.frame.height*2.0)
             self.EarthIV.transform = CGAffineTransform(scaleX: 8.0, y: 8.0)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                //Go to Next VC
                self.performSegue(withIdentifier: "FinishSplash", sender: nil)
            }
            
        }, completion: { (completed) in
            if completed {
                
            }
        })
        
    }
    
}
