//
//  WebViewController.swift
//  Weather
//
//  Created by Ivan Sebastian on 06/06/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
        
    }
    
    func loadURL(){
        let myURL = URL(string: "https://openweathermap.org/")
        let myRequest = URLRequest(url: myURL!)
        webView.loadRequest(myRequest)
    }



}
