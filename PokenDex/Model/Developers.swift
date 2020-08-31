//
//  Developers.swift
//  PokenDex
//
//  Created by Sabih on 30/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
import Foundation


struct Developers {
    
    var name: String
    var imageName: UIImage?
    var description: String
    
    init(name: String, imageName: UIImage?, description: String) {
        
        self.name = name
        self.description = description
        self.imageName = imageName
    }
}

let SyedSabihAli = Developers.init(name: "Syed Sabih Ali", imageName: UIImage(named: "1"), description: "Some description")

let OmarAdnan = Developers.init(name: "Omar Adnan", imageName: UIImage(named: "1"), description: "Some description")

let TyTyChau = Developers.init(name: "Ty Ty Chau", imageName: UIImage(named: "1"), description: "Some description")
