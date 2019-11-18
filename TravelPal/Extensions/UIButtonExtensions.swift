//
//  UIButtonExtensions.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingButton(){
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.width/2
        setTitleColor(Theme.background, for: .normal)
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 7)
    }
    
    func createButtonStyle(){
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(Theme.background, for: .normal)
        titleLabel?.font = UIFont(name: Theme.readingFont, size: 17)
        
    }
}
