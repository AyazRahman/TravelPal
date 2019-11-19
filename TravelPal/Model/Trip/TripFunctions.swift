//
//  TripFunctions.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel){
        DispatchQueue.global(qos: .userInteractive).async {
            Data.trips.append(tripModel)
        }
    }
    
    static func readTrips(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.trips.count == 0 {
                Data.trips.append(TripModel(title: "Russia"))
                Data.trips.append(TripModel(title: "Albania"))
                Data.trips.append(TripModel(title: "Madagascar"))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
        
    }
    
    static func updateTrip(tripModel: TripModel){
        
    }
    
    static func deleteTrip(tripModel: TripModel){
        
    }
}
