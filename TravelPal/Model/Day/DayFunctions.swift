//
//  DayFunctions.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 28/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import Foundation

class DayFunctions {
    static func createDays(at tripIndex: Int, using dayModel: DayModel){
        Data.trips[tripIndex].days.append(dayModel)
    }
}
