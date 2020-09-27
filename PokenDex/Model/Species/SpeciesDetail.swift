//
//  SpeciesDetail.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct SpeciesDetail : Model {
    let flavor_text_entries : [FlavorTextEntries]?
    
    
    public init(flavor_text_entries : [FlavorTextEntries]?) {
        self.flavor_text_entries = flavor_text_entries
    }
}
