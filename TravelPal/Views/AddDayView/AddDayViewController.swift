//
//  AddDayViewController.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 28/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var subTitleField: UITextField!
    @IBOutlet weak var cancelButtonRef: UIButton!
    @IBOutlet weak var saveButtonRef: UIButton!
    
    
    var finishedAdding: (() -> ())?
    var tripEditIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.addShadowAndRoundedCorners()
        popUpView.backgroundColor = Theme.background
        
        titleLabel.font = UIFont(name: Theme.displayFont, size: 25)
        //add label shadow for better readability
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 10
        //end label shadow
        
        cancelButtonRef.createButtonStyle()
        saveButtonRef.createButtonStyle()
        
        titleField.font = UIFont(name: Theme.readingFont, size: 17)
        titleField.delegate = self
        
        
        
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        titleField.layer.borderWidth = 0
        titleField.placeholder = "Enter Trip Name"
        
        guard titleField.hasValue, let newTitle = titleField.text else{
            return
        }
        guard subTitleField.hasValue, let newSubTitle = subTitleField.text else{
            return
        }
        /*if let index = tripEditIndex{
            TripFunctions.updateTrip(at: index, title: newTrip, image: imageView.image)
        }else{
            TripFunctions.createTrip(tripModel: TripModel(title: newTrip,image: imageView.image))
        }*/
        
        if let finishedAdding = finishedAdding{
            finishedAdding()
        }
        
        dismiss(animated: true)
    }
    
}

extension AddDayViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
