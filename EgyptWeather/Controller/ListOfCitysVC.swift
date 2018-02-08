//
//  ListOfCitysVC.swift
//  EgyptWeather
//
//  Created by Mahmoud Hamad on 2/7/18.
//  Copyright © 2018 Mahmoud SMGL. All rights reserved.
//

import UIKit

class ListOfCitysVC: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var Governorates: [Governorate]?
    var displayedGovernorates = [Governorate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self; tableView.dataSource = self
        searchBar.delegate = self
        displayedGovernorates = Governorates!
        //print(Governorates)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    

}
extension ListOfCitysVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != nil || searchText != " " {
            displayedGovernorates = (Governorates?.filter({ $0.name.contains(searchText) }))!
            tableView.reloadData()
        }
        if searchText == "" {
            displayedGovernorates = Governorates!
            searchBar.resignFirstResponder()
            tableView.reloadData()
        }
    }
}

extension ListOfCitysVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell {
            print(Governorates![indexPath.row].weather!)
            cell.configuerCell(weather: displayedGovernorates[indexPath.row].weather!)
            return cell
        }
        return WeatherCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedGovernorates.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dvc = storyboard?.instantiateViewController(withIdentifier: "WeatherPopUp") as! WeatherPopUp
        dvc.weather = displayedGovernorates[indexPath.row].weather
        present(dvc, animated: true, completion: nil)
    }
}
