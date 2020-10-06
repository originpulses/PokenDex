//
//  SpeciesDetail.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

struct SpeciesDetail : Model {
    let flavor_text_entries : [FlavorTextEntries]?
    
    
    init(flavor_text_entries : [FlavorTextEntries]?) {
        self.flavor_text_entries = flavor_text_entries
    }
}
