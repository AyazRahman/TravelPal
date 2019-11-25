//
//  UIViewExtension.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

extension UIView {
    func addShadowAndRoundedCorners(){
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.gray.cgColor
        layer.cornerRadius = frame.width * 0.05
    }
}
