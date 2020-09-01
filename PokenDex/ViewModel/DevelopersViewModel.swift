//
//  DevelopersViewModel.swift
//  PokenDex
//
//  Created by Sabih on 30/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation
import UIKit


struct DevelopersViewModel {
    
    private (set) var developers: [Developers] = []
    
    var count: Int {
        return developers.count
    }
    
    init() {
        loadItems()
    }
    
    private mutating func loadItems() {
        developers.append(SyedSabihAli)
        developers.append(OmarAdnan)
        developers.append(TyTyChau)
    }
    
    func getItems(byIndex index: Int) -> (name: String, description: String, image: UIImage?) {
        
        let name = developers[index].name
        let description = developers[index].description
        let image = developers[index].imageName
        
        return (name, description, image)
    }
}
