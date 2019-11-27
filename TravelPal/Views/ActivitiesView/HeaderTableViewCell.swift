//
//  HeaderTableViewCell.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 26/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: Theme.bodyFontBold, size: 20)
        subTitleLabel.font = UIFont(name: Theme.bodyFont, size: 17)
    }

    func setup(model: DayModel){
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
    }
}
