//
//  DateExtension.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 28/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import Foundation

extension Date{
    func mediumDate() ->String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
