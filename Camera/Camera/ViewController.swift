//
//  ViewController.swift
//  Camera
//
//  Created by Caleb Wells on 10/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    let session = AVCaptureSession()
    let photoOutput = AVCapturePhotoOutput()
    var capturePreview: CapturePreview!

    override func viewDidLoad() {
        super.viewDidLoad()
        capturePreview = CapturePreview()
//        capturePreview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(capturePreview)
        
//        capturePreview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        capturePreview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        capturePreview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        capturePreview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        (capturePreview.layer as! AVCaptureVideoPreviewLayer).session = session
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _ = configureSession()
    }
    
    func configureSession() -> Bool {
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        do {
            let videoCaptureDevice = AVCaptureDevice.default(for: .video)
            let videoDeviceInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
            
            if session.canAddInput(videoDeviceInput) {
                session.addInput(videoDeviceInput)
            } else {
                print("Video failed.")
                session.commitConfiguration()
                return false
            }
            
            if session.canAddOutput(photoOutput) {
                session.addOutput(photoOutput)
                photoOutput.isHighResolutionCaptureEnabled = true
            } else {
                print("Photo failed")
                session.commitConfiguration()
                return false
            }
        } catch {
            print("Faild \(error)")
            session.commitConfiguration()
            return false
        }
        
        print("We made it!")
        session.commitConfiguration()
        session.startRunning()
        return true
    }
    
    func capturePhoto() {
        guard let rawFormat = photoOutput.supportedRawPhotoPixelFormatTypes(for: .dng).first else {
            let photoSettings = AVCapturePhotoSettings(rawPixelFormatType: rawFormat.uint32Value)
            photoSettings.isHighResolutionPhotoEnabled = true
            photoSettings.flashMode = .off
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
        
        print("click!")
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput, willBeginCaptureForResolvesSettings resolvedSettings: AVCaptureResolvedPhotoSettings) {
        // Update UI?
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let data = photo.fileDataRepresentation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        capturePhoto()
    }

}
