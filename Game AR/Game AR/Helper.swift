//
//  Helper.swift
//  Game AR
//
//  Created by Caleb Wells on 9/6/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import Foundation
import SpriteKit

enum SetupState {
    case addTarget
    case existingSprites
}

class Helper {
    static var stringName: String = ""
    static var setupState: SetupState = .addTarget
    static var setupStateArray = [SKSpriteNode]()
}
