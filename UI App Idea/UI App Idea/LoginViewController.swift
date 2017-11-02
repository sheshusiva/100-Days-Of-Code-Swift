//
//  LoginViewController.swift
//  UI App Idea
//
//  Created by Caleb Wells on 11/1/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIImagePickerControllerDelegate {
    
    var inputImage: UIImage?
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        
        setupImageView()
    }
    
    func setupImageView() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        view.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        imageView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func selectPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(picker, animated: true)
        print("====== select a photo")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        
        imageView.image = image
        inputImage = image
        
        dismiss(animated: true) {
            // detect faces!
        }
    }
}
