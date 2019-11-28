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
    var date: Date = Date()
    var activities = [ActivityModel]()
    
    init(title: String, subTitle: Date, activities: [ActivityModel]? = nil){
        id = UUID().uuidString
        self.title = title
        self.date = subTitle
        
        if let data = activities{
            self.activities = data
        }
    }
}

extension DayModel: Comparable{
    static func < (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func == (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.id == rhs.id
    }
}
