//
//  ActivitiesTableViewCell.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 27/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontHeavy, size: 17)
        subTitleLabel.font = UIFont(name: Theme.bodyFont, size: 17)
    }

    func setup(model: ActivityModel){
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        photoView.image = getActivityImage(type: model.activityType)
    }
    
    func getActivityImage(type: ActivityType) -> UIImage?{
        switch type {
            case .flight:
            return UIImage(named: "flight")
            
        }
    }

}
