//
//  LoginViewController.swift
//  UI App Idea
//
//  Created by Caleb Wells on 11/1/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import Vision

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedImageFromPicker: UIImage?
    let addImage = UIImage(named: "")
    var detectedFaces = [(observation: VNFaceObservation, blur: Bool)]()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        text.textColor = .red
        text.textAlignment = .center
        text.isEditable = false
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(textView)
        
        setupImageView()
        setupTextView()
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
    
    func setupTextView() {
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45).isActive = true
        textView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func selectPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info["UIImagePickerControllerEditedImage"] {
            selectedImageFromPicker = editedImage as? UIImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] {
            selectedImageFromPicker = originalImage as? UIImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            imageView.image = selectedImage
        }
        
        dismiss(animated: true) {
            self.detectFaces()
        }
    }
    
    func detectFaces() {
        guard let selectedImageFromPicker = selectedImageFromPicker else { return }
        
        guard let ciImage = CIImage(image: selectedImageFromPicker) else { return }
        
        let request = VNDetectFaceRectanglesRequest {
            [unowned self] request, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let observations = request.results as? [VNFaceObservation] else { return }
                self.detectedFaces = Array(zip(observations, [Bool](repeating: false, count: observations.count)))
            }
            
            request.results?.forEach({(request) in
                guard let faceObservation = request as? VNFaceObservation else { return }
                
                //self.textView.text = "Faces detected: \(self.detectedFaces.count)"
                print("=== \(faceObservation.boundingBox)")
            })
            
            if self.detectedFaces.count == 0 {
                self.imageView.image = self.addImage
                self.textView.text = "Please choose a photo with your face in the shot."
            } else if self.detectedFaces.count > 0 {
                self.textView.text = ""
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        do {
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
