//
//  TypePokemon.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

struct TypePokemon : Model {
    let pokemon : Pokemon?
    
    init(pokemon : Pokemon?) {
        self.pokemon = pokemon
    }
    
}
