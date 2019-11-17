//
//  TripModel.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import Foundation

class TripModel {
    var id: String!
    var title: String!
    
    init(title: String){
        self.id = UUID().uuidString
        self.title = title
    }
}
