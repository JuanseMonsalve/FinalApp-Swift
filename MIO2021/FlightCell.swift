//
//  FlightCell.swift
//  MIO2021
//  GROUP: Juan S Monsalve, Esmeralda Iyescas, Norberto Otero
//  Created by Juan S Monsalve on 11/28/21.
//

import UIKit

class FlightCell: UITableViewCell {

    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stopsLabel: UILabel!
    @IBOutlet weak var lastSoldLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
