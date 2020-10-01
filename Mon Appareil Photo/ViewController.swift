//
//  ViewController.swift
//  Mon Appareil Photo
//
//  Created by Rodolphe DUPUY on 24/08/2020.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var picker: UIImagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        picker.allowsEditing = true
    }
    
    @IBAction func takePicture(_ sender: Any) {
        // Ajouter dans plist: Privacy - Camera Usage Description
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        } else {
            print("Pas de Caméra les amis")
        }
    }
    
    @IBAction func choseLibrary(_ sender: Any) {
        // Ajouter dans plist: Privacy - Photo Library Usage Description
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Annulation
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Récupération de photo
//        //Image complete
//        if let photo = info[.originalImage] as? UIImage {
//            imageView.image = photo
//        }
        //Photo recadrée
        if let photo = info[.editedImage] as? UIImage {
            imageView.image = photo
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

