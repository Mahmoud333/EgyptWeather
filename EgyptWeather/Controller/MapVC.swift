//
//  ViewController.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/5/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    var Governorates  = [Suez, BeniSuef, Beheira, Asyut, Aswan, alexandria, Dakahlia, Cairo, Giza, Gharbia, Faiyum, Damietta, Matruh, Luxor, KafrElSheikh, Ismailia, Minya, Monufia, NewValley, NorthSinai, PortSaid, Qalyubia, Qena,  RedSea, Sharqia, Sohag, SouthSinai, Suez]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        
        for govern in Governorates {
            
            WeatherService.instance.getWeather(lat: govern.latitude, long: govern.longitude, completion: { (success, weather) in
                
                if success {
                    govern.weather = weather
                    govern.weather?.CityName = govern.name.capitalized
                    self.drawAnnotation(governorate: govern)
                }
            })
        }        
    }
    
    func drawAnnotation(governorate: Governorate) {
        
        let location = CLLocationCoordinate2D(latitude: governorate.latitude, longitude: governorate.longitude)
        let anno = Annotation(coordinate: location, title: governorate.name, subTitle: "\(governorate.weather!.currentTempCelsius!)", id: governorate.id)
        /*let annotation = MKPointAnnotation()
         annotation.coordinate = location
         annotation.title = governorate.name
         annotation.subtitle = "akjfjlahnsf"*/
        
        mapView.addAnnotation(anno)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToListOfCitysVC" {
            if let dvc = segue.destination as? ListOfCitysVC {
                dvc.Governorates = Governorates
            }
        }
    }
    
    
    
}

extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("didSelect")
        if let anno = view.annotation as? Annotation {
            print(anno.title)
            print(anno.subtitle)
            print(anno.id)
            print(anno.coordinate)
            
            let choosenWeather = Governorates.filter({ (governorates) -> Bool in
                governorates.id == anno.id
            })
            
            print("choosen Govern currentTemp: \(choosenWeather.first?.weather?.currentTempCelsius ?? 0)")
            
            let dvc = storyboard?.instantiateViewController(withIdentifier: "WeatherPopUp") as! WeatherPopUp
            dvc.weather = choosenWeather.first?.weather
            present(dvc, animated: true, completion: nil)
            
            
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let anno = annotation as? Annotation {
            
            var annotationView: MKAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Temp")
            annotationView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            label.font = UIFont(name: "Avenir-Heavy", size: 14)
            label.textColor = UIColor.blue
            label.backgroundColor = UIColor.white
            label.text = " \(anno.subtitle!)°"
            label.isUserInteractionEnabled = true
            label.layer.cornerRadius = 15
            label.clipsToBounds = true
            annotationView.addSubview(label)
            
            return annotationView
        }
        return nil
        
    }
}













