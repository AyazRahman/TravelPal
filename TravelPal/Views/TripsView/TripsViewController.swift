//
//  TripsViewController.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    var tripEditIndex: Int?
    let seenHelpKey = "SeenHelp"
    
    @IBOutlet var helpView: UIVisualEffectView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButtonRef: UIButton!
    
    
    @IBAction func cancelButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpKey)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = Theme.background
        
        addButtonRef.createFloatingButton()
        
        // weak self since tripsfunctions will be accessed in multiple classes
        TripFunctions.readTrips {[unowned self] in
            self.tableView.reloadData()
            self.showHelp()
        }
    }
    
    fileprivate func showHelp() {
        if !UserDefaults.standard.bool(forKey: self.seenHelpKey), !Data.trips.isEmpty {
            self.view.addSubview(self.helpView)
            self.helpView.frame = self.view.frame
            self.helpView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.helpView.alpha = 1
            }
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTrip"{
            let destination = segue.destination as! AddTripViewController
            destination.tripEditIndex = tripEditIndex
            destination.finishedAdding = { [weak self] in
                self?.tableView.reloadData()
                self?.showHelp()
            }
            tripEditIndex = nil
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.trips[indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete \(trip.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                //Perform Delete
                TripFunctions.deleteTrip(tripModel: trip)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
                //tableView.reloadData()
            }))
            
            self.present(alert, animated: true)
        }
        
        delete.image = UIImage(named: "Delete")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            self.tripEditIndex = indexPath.row
            self.performSegue(withIdentifier: "AddTrip", sender: nil)
            actionPerformed(true)
        }
        edit.image = UIImage(named: "EditIcon")
        edit.backgroundColor = UIColor(named: "Edit")
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = Data.trips[indexPath.row]
        
        let storyboard = UIStoryboard(name: "ActivitiesView", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesViewController
        
        vc.tripID = trip.id
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
