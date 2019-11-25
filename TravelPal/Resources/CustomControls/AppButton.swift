//
//  AppButton.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 25/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class AppButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(Theme.background, for: .normal)
        titleLabel?.font = UIFont(name: Theme.readingFont, size: 17)
    }

}
