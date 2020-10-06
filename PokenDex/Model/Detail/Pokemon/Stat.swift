//
//  Stat.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

struct Stat : Model {
    let name : String?
    let url : String?
    
    init(name : String?, url : String?) {
        self.name = name
        self.url = url
    }
    
}
