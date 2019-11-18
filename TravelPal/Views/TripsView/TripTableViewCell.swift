//
//  TripTableViewCell.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tripNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorners()
        cardView.backgroundColor = Theme.accent
        tripNameLabel.font = UIFont(name: Theme.displayFont, size: 32)
    }
    
    
    func setup(trip: TripModel){
        tripNameLabel.text = trip.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
