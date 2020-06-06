//
//  WeatherCell.swift
//  Weather
//
//  Created by Ivan Sebastian on 06/06/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var CountryLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
