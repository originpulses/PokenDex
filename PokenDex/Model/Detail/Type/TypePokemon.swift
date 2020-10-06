//
//  TypePokemon.swift
//  PokenDex
//
//  Created by Sabih on 23/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

public struct TypePokemon : Model {
    let pokemon : Pokemon?
    
    public init(pokemon : Pokemon?) {
        self.pokemon = pokemon
    }
    
}
