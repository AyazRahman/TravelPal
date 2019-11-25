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
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorners()
        cardView.backgroundColor = Theme.accent
        tripNameLabel.font = UIFont(name: Theme.displayFont, size: 32)
        cellImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    
    func setup(trip: TripModel){
        tripNameLabel.text = trip.title
        cellImageView.image = nil
        if let tripImage = trip.image{
            cellImageView.alpha = 0.3
            cellImageView.image = tripImage
            UIView.animate(withDuration: 1) {
                self.cellImageView.alpha = 1
            }
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
