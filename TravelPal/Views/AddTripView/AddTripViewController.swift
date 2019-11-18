//
//  AddTripViewController.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var cancelButtonRef: UIButton!
    @IBOutlet weak var saveButtonRef: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.addShadowAndRoundedCorners()
        popUpView.backgroundColor = Theme.background
        
        titleLabel.font = UIFont(name: Theme.displayFont, size: 25)
        
        cancelButtonRef.createButtonStyle()
        saveButtonRef.createButtonStyle()
        
        inputField.font = UIFont(name: Theme.readingFont, size: 17)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
