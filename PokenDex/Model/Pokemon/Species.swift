//
//  Species.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct Species : Model {
    let name : String?
    let url : String?
    
    public init(name : String?, url : String?) {
        self.name = name
        self.url = url
    }
}
