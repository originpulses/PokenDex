//
//  PokemonDetail.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct PokemonDetail : Model {
    let id : Int?
    let name : String?
    let stats : [Stats]?
    let types : [Types]?
    let species : Species?
    
    public init(id : Int?, name : String?, stats : [Stats]?, types : [Types]?, species : Species?) {
        self.id = id
        self.name = name
        self.stats = stats
        self.types = types
        self.species = species
        
    }
}
