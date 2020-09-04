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

let SyedSabihAli = Developers.init(name: "Syed Sabih Ali", imageName: UIImage(named: "SSA"), description: "I am currently a student in RMIT University doing Bachelors of IT. My hobbies include photography, games and coding")

let OmarAdnan = Developers.init(name: "Omar Adnan", imageName: UIImage(named: "OA"), description: "Student in RMIT University. Enrolled in Bachelors of IT. Doing this course because it seems fun.")

let TyTyChau = Developers.init(name: "Ty Ty Chau", imageName: UIImage(named: "TTC"), description: "My name is Ty and I'm doing Bachelors of IT. My interests are watching movies and games.")
