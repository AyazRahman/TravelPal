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
    @IBOutlet weak var imageView: UIImageView!
    
    var finishedAdding: (() -> ())?
    
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
        
        imageView.layer.cornerRadius = imageView.frame.width * 0.05
        
        
        cancelButtonRef.createButtonStyle()
        saveButtonRef.createButtonStyle()
        
        inputField.font = UIFont(name: Theme.readingFont, size: 17)
        inputField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        inputField.layer.borderWidth = 0
        inputField.placeholder = "Enter Trip Name"
        
        guard inputField.text != "", let newTrip = inputField.text else{
            inputField.layer.borderColor = UIColor.red.cgColor
            inputField.layer.borderWidth = 1
            inputField.layer.cornerRadius = 5
            inputField.placeholder = "Name is required"

            return
        }
        
        TripFunctions.createTrip(tripModel: TripModel(title: newTrip,image: imageView.image))
        if let finishedAdding = finishedAdding{
            finishedAdding()
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        let controller = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            controller.sourceType = .camera
            
        } else {
            controller.sourceType = .photoLibrary
        }
        
        controller.allowsEditing = true
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension AddTripViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension AddTripViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
