//
//  TripsViewController.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButtonRef: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = Theme.background
        
        addButtonRef.createFloatingButton()
        
        // weak self since tripsfunctions will be accessed in multiple classes
        TripFunctions.readTrips {[weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTrip"{
            let destination = segue.destination as! AddTripViewController
            destination.finishedAdding = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension TripsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "TripCell") as! TripTableViewCell
        
        cell.setup(trip: Data.trips[indexPath.row])
        
        return cell
    }
    
}

extension TripsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
