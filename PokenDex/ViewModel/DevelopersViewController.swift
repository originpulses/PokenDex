//
//  DevelopersViewController.swift
//  PokenDex
//
//  Created by Sabih on 30/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

class DevelopersViewController: UIViewController {

    var selectedItem: (name: String, description: String, image: UIImage?)?
    

    @IBOutlet weak var devName: UILabel!
    @IBOutlet weak var devImage: UIImageView!
    @IBOutlet weak var devDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedItem = selectedItem {
            devName.text = selectedItem.name
            devImage.image = selectedItem.image
            devDescription.text = selectedItem.description
        }
    }
}
