//
//  ActivitiesViewController.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 26/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    var tripID: UUID!
    var currentTrip: TripModel?
    var sectionHeaderHeight: CGFloat = 0.0
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButtonRef: UIButton!
    
    @IBAction func addButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "What would you like to add?", message: nil, preferredStyle: .actionSheet)
        
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        let activityAction = UIAlertAction(title: "Activity", style: .default, handler: handleAddActivity)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: sender.bounds.height)
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    fileprivate func handleAddDay(action: UIAlertAction){
        let storyboard = UIStoryboard(name: "AddDayView", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        present(vc, animated: true)
    }
    
    fileprivate func handleAddActivity(action: UIAlertAction){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        addButtonRef.createFloatingButton()
        
        TripFunctions.readTrip(by: tripID) { [weak self] (model) in
            guard let self = self else {return}
            self.currentTrip = model
            
            guard let model = model else {return}
            self.title = model.title
            self.backgroundImage.image = model.image
            self.tableView.reloadData()
            
        }
        
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
    }
   
}

extension ActivitiesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTrip?.days[section].activities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let day = currentTrip?.days[indexPath.section].activities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier) as! ActivitiesTableViewCell
        
        cell.setup(model: day!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentTrip?.days.count ?? 0
    }
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = currentTrip?.days[section].title ?? ""
        let subTitle = currentTrip?.days[section].subTitle ?? ""
        return "\(title) - \(subTitle)"
    }*/
}

extension ActivitiesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let day = currentTrip?.days[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        cell.setup(model: day!)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
}
