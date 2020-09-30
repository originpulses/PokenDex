//
//  FlavourTextEntries.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct FlavorTextEntries : Model {
    let flavor_text : String?
    let language : Language?
    let version : Version?
    
    public init(flavor_text : String?, language : Language?, version : Version?)  {
        self.flavor_text = flavor_text
        self.language = language
        self.version = version
    }
    
}
