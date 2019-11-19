//
//  TripModel.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    
    
    init(title: String, image: UIImage? = nil){
        self.id = UUID()
        self.title = title
        self.image = image
    }
}
