//
//  TripModel.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

struct TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    var days = [DayModel](){
        didSet{
            //Called when a new value is added
            days = days.sorted(by: <)
        }
    }
    
    
    init(title: String, image: UIImage? = nil, days: [DayModel]? = nil){
        self.id = UUID()
        self.title = title
        self.image = image
        
        if let days = days{
            self.days = days
        }
    }
}
