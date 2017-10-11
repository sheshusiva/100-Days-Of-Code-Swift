//
//  CapturePreviewView.swift
//  Camera
//
//  Created by Caleb Wells on 10/10/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import UIKit
import AVFoundation

class CapturePreview: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

}
