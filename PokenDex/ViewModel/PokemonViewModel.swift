//
//  PokemonViewModel.swift
//  PokenDex
//
//  Created by Sabih on 20/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation
import UIKit

struct PokemonViewModel {
    
    private (set) var pokemons: [Pokemon] = []
    
    var count: Int {
        return pokemons.count
    }
    
    private mutating func loadPokemon() {
        pokemons.append(Pokemon.Bulbasaur)
        pokemons.append(Pokemon.Ivysaur)
        pokemons.append(Pokemon.Venusaur)
        pokemons.append(Pokemon.Charmandar)
        pokemons.append(Pokemon.Charmeleon)
        pokemons.append(Pokemon.Charizard)
        pokemons.append(Pokemon.Squirtle)
        pokemons.append(Pokemon.Wartortle)
        pokemons.append(Pokemon.Blastoise)
        pokemons.append(Pokemon.Caterpie)
        pokemons.append(Pokemon.Metapod)
        pokemons.append(Pokemon.Butterfree)
    }
    
    func getPokemon(byIndex index: Int) -> (title: String, description: String, image: UIImage?, id: String, type: String, attack: String, defense: String, height: String, weight: String) {
        
        let title = pokemons[index].rawValue
        let description = pokemons[index].description
        let image = UIImage(named: pokemons[index].imageName)
        let id = pokemons[index].pokedexID
        let type = pokemons[index].type
        let attack = pokemons[index].attack
        let defense = pokemons[index].defense
        let height = pokemons[index].height
        let weight = pokemons[index].weight
        
        return (title, description, image, id, type, attack, defense, height, weight)
    }
}
