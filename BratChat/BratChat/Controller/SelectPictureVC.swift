//
//  SelectPictureVC.swift
//  BratChat
//
//  Created by David E Bratton on 10/25/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class SelectPictureVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageText: UITextField!
    
    var pickerController = UIImagePickerController()
    var imageAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerController.delegate = self
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            imageAdded = true
        }
        
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    func presentAlert(alert:String) {
        let alertVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func selectPhotoBtnPressed(_ sender: UIBarButtonItem) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true) {
        }
    }
    
    @IBAction func cameraBtnPressed(_ sender: UIBarButtonItem) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true) {
        }
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if let message = messageText.text {
            if imageAdded && message != "" {
                // Segue to next VC
                
            } else {
                // Show error with alert
                presentAlert(alert: "You must provide an image and a message for your snap!")
            }
        }
        
    }
    
    
}
