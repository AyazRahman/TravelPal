//
//  DayModel.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 26/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import Foundation

struct DayModel{
    let id: String
    var title: String = ""
    var subTitle: String = ""
    var activities = [ActivityModel]()
    
    init(title: String, subTitle: String, activities: [ActivityModel]? = nil){
        id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
        
        if let data = activities{
            self.activities = data
        }
    }
}
