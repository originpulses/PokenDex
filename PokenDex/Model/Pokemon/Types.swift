//
//  Types.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct Types : Model {
    let slot : Int?
    let type : Type?
    
    public init(slot : Int?, type : Type?) {
        self.slot = slot
        self.type = type
    }
    
}
