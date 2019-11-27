//
//  AddTripViewController.swift
//  TravelPal
//
//  Created by Ayaz Rahman on 18/11/19.
//  Copyright © 2019 Ayaz Rahman. All rights reserved.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var cancelButtonRef: UIButton!
    @IBOutlet weak var saveButtonRef: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
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
        
        imageView.layer.cornerRadius = imageView.frame.width * 0.05
        
        
        cancelButtonRef.createButtonStyle()
        saveButtonRef.createButtonStyle()
        
        inputField.font = UIFont(name: Theme.readingFont, size: 17)
        inputField.delegate = self
        
        if let index = tripEditIndex{
            let trip = Data.trips[index]
            inputField.text = trip.title
            imageView.image = trip.image
            titleLabel.text = "Edit Trip"
        }
        
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
        if let index = tripEditIndex{
            TripFunctions.updateTrip(at: index, title: newTrip, image: imageView.image)
        }else{
            TripFunctions.createTrip(tripModel: TripModel(title: newTrip,image: imageView.image))
        }
        
        if let finishedAdding = finishedAdding{
            finishedAdding()
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        
        //define the actionSheet to show options
        let actionSheet = UIAlertController(title: "Image", message: "Select the source", preferredStyle: .actionSheet)
        //add actions to the action sheet
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.checkCameraAccess()
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.checkPhotoLibraryAccess()
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(actionSheet, animated: true)
        
    }
    
    //This function checks the authorization of camera for the app
    func checkCameraAccess(){
        photoPickerController("camera")
    }
    
    //This function checks the authorization of photo library for the app
    func checkPhotoLibraryAccess(){
        PHPhotoLibrary.requestAuthorization { (access) in
            switch access{
                case .authorized:
                    DispatchQueue.main.sync{
                        self.photoPickerController("photo")
                }
                case .notDetermined:
                    if access == PHAuthorizationStatus.authorized{
                        DispatchQueue.main.sync{
                            self.photoPickerController("photo")
                        }
                }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library is restricted and cannot be accessed", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Access Denied", message: "Photo Library was previously denied. Please update Settings to gain access", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Go to Settings", style: .default, handler: { (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    DispatchQueue.main.sync {
                        self.present(alert, animated: true)
                }
                @unknown default:
                    print("default")
                    fatalError()
            }
        }
        
    }
    
    func photoPickerController(_ source: String){
        //set up image picker controller
        let controller = UIImagePickerController()
        controller.allowsEditing = true
        controller.delegate = self
        controller.sourceType = source == "camera" ? .camera : .photoLibrary
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
