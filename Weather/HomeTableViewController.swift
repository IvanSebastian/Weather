//
//  HomeTableViewController.swift
//  Weather
//
//  Created by Ivan Sebastian on 06/06/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import WebKit

class HomeTableViewController: UITableViewController {

    var loadingIndicator: UIActivityIndicatorView!
    
    let country = ["Jakarta", "Bandung", "Serang", "Semarang", "Tangerang", "Bekasi", "Jogjakarta", "Surabaya", "Bogor","Depok"]
    
    let countryId = ["1642911","1650357","1627549","1627896","1625084","1649378","1621177","1625822","1648473","8144495"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    
    func fetchData(){
        AF.request("https://api.openweathermap.org/data/2.5/weather?id=1642911&appid=4e9ef8e21bda8ef304229ebdfe1bb152").responseJSON {
            response in
            
            let json = JSON(response.value)
            print(json)
            
        } 
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return country.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell

        // Configure the cell...
        cell.CountryLbl.text = country[indexPath.row]
        cell.idLbl.text = countryId[indexPath.row]
        
        return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name:"Main", bundle: nil).instantiateViewController(identifier: "web") as! WebViewController
        webVC.modalPresentationStyle = .fullScreen
        self.present(webVC,animated: true)
    }

}
