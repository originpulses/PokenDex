////
////  PokemonViewModel.swift
////  PokenDex
////
////  Created by Sabih on 20/8/20.
////  Copyright © 2020 RMIT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//struct PokemonViewModel {
//    
//    private (set) var pokemons: [Pokemon] = []
//    
//    var count: Int {
//        return pokemons.count
//    }
//    
//    init() {
//        loadPokemon()
//    }
//    
//    
//    // There are over 500 Pokemons and we only hard coded some of them to populate our collectionview
//    // With the help of PokeAPI we will be able to get all 500+ Pokemons
//    private mutating func loadPokemon() {
//        pokemons.append(Bulbasaur)
//        pokemons.append(Ivysaur)
//        pokemons.append(Venusaur)
//        pokemons.append(Charmandar)
//        pokemons.append(Charmeleon)
//        pokemons.append(Charizard)
//        pokemons.append(Squirtle)
//        pokemons.append(Wartortle)
//        pokemons.append(Blastoise)
//        pokemons.append(Caterpie)
//        pokemons.append(Metapod)
//        pokemons.append(Butterfree)
//        pokemons.append(Pidgeot)
//        pokemons.append(Pikachu)
//        pokemons.append(Raichu)
//        pokemons.append(Nidoking)
//        pokemons.append(Gengar)
//        pokemons.append(Onix)
//        pokemons.append(Steelix)
//        pokemons.append(Eevee)
//        pokemons.append(Umbreon)
//        pokemons.append(Articuno)
//        pokemons.append(Dragonite)
//        pokemons.append(Mewtwo)
//        pokemons.append(Tyranitar)
//        pokemons.append(Groudon)
//        pokemons.append(Kyogre)
//        pokemons.append(Lucario)
//        pokemons.append(Xerneas)
//    }
//    
//    func getPokemon(byIndex index: Int) -> (name: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, colour: UIColor?) {
//    
//            let name = pokemons[index].name
//            let description = pokemons[index].description
//            let image = pokemons[index].imageName
//            let id = pokemons[index].pokedexID
//            let type = pokemons[index].type
//            let HP = pokemons[index].HP
//            let attack = pokemons[index].attack
//            let defense = pokemons[index].defense
//            let specialAttack = pokemons[index].specialAttack
//            let specialDefense = pokemons[index].specialDefense
//            let speed = pokemons[index].specialDefense
//            let colour = pokemons[index].colour
//    
//            return (name, description, image, id, type, HP, attack, defense, specialAttack, specialDefense, speed, colour)
//        }
//}
