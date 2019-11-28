//
//  UITextFieldExtension.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 28/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

extension UITextField {
    var hasValue: Bool{
        guard text == "" else {return true}
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        placeholder = "Field Required!"
        return false
    }
}
