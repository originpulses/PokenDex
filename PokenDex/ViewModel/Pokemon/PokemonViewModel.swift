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
    
    init() {
        loadPokemon()
    }
    
    
    // There are over 500 Pokemons and we only hard coded some of them to populate our collectionview
    // With the help of PokeAPI we will be able to get all 500+ Pokemons as PokeAPI owners have all the data and we just have to fetch it
    private mutating func loadPokemon() {
        pokemons.append(Bulbasaur)
        pokemons.append(Ivysaur)
        pokemons.append(Venusaur)
        pokemons.append(Charmandar)
        pokemons.append(Charmeleon)
        pokemons.append(Charizard)
        pokemons.append(Squirtle)
        pokemons.append(Wartortle)
        pokemons.append(Blastoise)
        pokemons.append(Caterpie)
        pokemons.append(Metapod)
        pokemons.append(Butterfree)
        pokemons.append(Pidgeot)
        pokemons.append(Pikachu)
        pokemons.append(Raichu)
        pokemons.append(Nidoking)
        pokemons.append(Gengar)
        pokemons.append(Onix)
        pokemons.append(Steelix)
        pokemons.append(Eevee)
        pokemons.append(Umbreon)
        pokemons.append(Articuno)
        pokemons.append(Dragonite)
        pokemons.append(Mewtwo)
        pokemons.append(Tyranitar)
        pokemons.append(Groudon)
        pokemons.append(Kyogre)
        pokemons.append(Lucario)
        pokemons.append(Xerneas)
    }
    
    func getPokemon(byIndex index: Int) -> (name: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, color: UIColor?) {
    
            let name = pokemons[index].name
            let description = pokemons[index].description
            let image = pokemons[index].imageName
            let id = pokemons[index].pokedexID
            let type = pokemons[index].type
            let HP = pokemons[index].HP
            let attack = pokemons[index].attack
            let defense = pokemons[index].defense
            let specialAttack = pokemons[index].specialAttack
            let specialDefense = pokemons[index].specialDefense
            let speed = pokemons[index].specialDefense
            let color = pokemons[index].color
    
            return (name, description, image, id, type, HP, attack, defense, specialAttack, specialDefense, speed, color)
        }
}
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
//    private mutating func loadPokemon() {
//        pokemons.append(Pokemon.Bulbasaur)
//        pokemons.append(Pokemon.Ivysaur)
//        pokemons.append(Pokemon.Venusaur)
//        pokemons.append(Pokemon.Charmandar)
//        pokemons.append(Pokemon.Charmeleon)
//        pokemons.append(Pokemon.Charizard)
//        pokemons.append(Pokemon.Squirtle)
//        pokemons.append(Pokemon.Wartortle)
//        pokemons.append(Pokemon.Blastoise)
//        pokemons.append(Pokemon.Caterpie)
//        pokemons.append(Pokemon.Metapod)
//        pokemons.append(Pokemon.Butterfree)
//    }
//
//    func getPokemon(byIndex index: Int) -> (title: String, description: String, image: UIImage?, color: UIColor?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String) {
//
//        let title = pokemons[index].rawValue
//        let description = pokemons[index].description
//        let image = UIImage(named: pokemons[index].imageName)
//        let color = UIColor(hex: pokemons[index].color)
//        let id = pokemons[index].pokedexID
//        let type = pokemons[index].type
//        let HP = pokemons[index].HP
//        let attack = pokemons[index].attack
//        let defense = pokemons[index].defense
//        let specialAttack = pokemons[index].specialAttack
//        let specialDefense = pokemons[index].specialDefense
//        let speed = pokemons[index].specialDefense
//
//        return (title, description, image, color, id, type, HP, attack, defense, specialAttack, specialDefense, speed)
//    }
//}


// An extension that lets you pass hex code to UIColor
// Reference used: https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
