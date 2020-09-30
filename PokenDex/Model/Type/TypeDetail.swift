//
//  TypeDetail.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct TypeDetail : Model {
    let pokemon : [TypePokemon]?
    
    public init(pokemon: [TypePokemon]?) throws {
        self.pokemon = pokemon
    }
    
}
