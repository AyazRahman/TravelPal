//
//  TripFunctions.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import Foundation
import UIKit

class TripFunctions {
    static func createTrip(tripModel: TripModel){
        
        Data.trips.append(tripModel)
        
    }
    
    static func readTrips(completion: @escaping () -> ()){
        let activity = ActivityModel(title: "From Melbourne", subTitle: "12:25 - 13:45", activityType: .flight)
        let day = DayModel(title: "Departure", subTitle: "November 14", activities: [activity])
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.trips.count == 0 {
                Data.trips.append(TripModel(title: "Russia", days: [day]))
                Data.trips.append(TripModel(title: "Albania"))
                Data.trips.append(TripModel(title: "Madagascar"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }

    }
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()){
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.trips.first(where: {$0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil){
        Data.trips[index].title = title
        Data.trips[index].image = image
    }
    
    static func deleteTrip(tripModel: TripModel){
        if let index = Data.trips.firstIndex(where: {$0.id.uuidString == tripModel.id.uuidString}) {
            Data.trips.remove(at: index)
        }
        
    }
}
