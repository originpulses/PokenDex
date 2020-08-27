//
//  Pokemon.swift
//  PokenDex
//
//  Created by Sabih on 20/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

enum Pokemon: String {
    
    case Bulbasaur = "Bulbasaur", Ivysaur = "Ivysaur", Venusaur = "Venusaur", Charmandar = "Charmandar", Charmeleon = "Charmeleon", Charizard = "Charizard", Squirtle = "Squirtle", Wartortle = "Wartortle", Blastoise = "Blastoise", Caterpie = "Caterpie", Metapod = "Metapod", Butterfree = "Butterfree"
    
    var imageName: String {
        
        switch self {
        case .Bulbasaur:
            return "1"
        case .Ivysaur:
            return "2"
        case .Venusaur:
            return "3"
        case .Charmandar:
            return "4"
        case .Charmeleon:
            return "5"
        case .Charizard:
            return "6"
        case .Squirtle:
            return "7"
        case .Wartortle:
            return "8"
        case .Blastoise:
            return "9"
        case .Caterpie :
            return "10"
        case .Metapod:
            return "11"
        case .Butterfree:
            return "12"
        }
    }
        
    var description: String {
        
        switch self {
        case .Bulbasaur:
            return "A young Bulbasaur uses the nutrients from it's seed for the energy it needs to grow"
        case .Ivysaur:
            return "The stronger the sunlight it absorbs, the stronger this Pokemon becomes"
        case .Venusaur:
            return "Venusaur uses its large petals to capture sunlight and transform into energy"
        case .Charmandar:
            return "The flame that burns at the tip of its tail is an indication of its emotions"
        case .Charmeleon:
            return "When it swings its burning tail, it elevates the temprature to unbearably high levels"
        case .Charizard:
            return "Spits fire that is hot enough to melt boulders, Known to cause forest fires unintenionally"
        case .Squirtle:
            return "Shoots water at prey while in the water. Withdraws into its shell when in danger"
        case .Wartortle:
            return "Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance"
        case .Blastoise:
            return "Once it takes aim at its enemy, it blasts out water with even more force than a fire hose"
        case .Caterpie :
            return "Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls"
        case .Metapod:
            return "Hardens its shell to protect itself"
        case .Butterfree:
            return "In battle, it flaps its wings at high speed to release highly toxic dust into the air"
        }
    }
    
    var pokedexID: String {
        
        switch self {
        case .Bulbasaur:
            return "#001"
        case .Ivysaur:
            return "#002"
        case .Venusaur:
            return "#003"
        case .Charmandar:
            return "#004"
        case .Charmeleon:
            return "#005"
        case .Charizard:
            return "#006"
        case .Squirtle:
            return "#007"
        case .Wartortle:
            return "#008"
        case .Blastoise:
            return "#009"
        case .Caterpie :
            return "#010"
        case .Metapod:
            return "#011"
        case .Butterfree:
            return "#012"
        }
    }
    
    var type: String {
        
        switch self {
        case .Bulbasaur:
            return "Grass"
        case .Ivysaur:
            return "Grass"
        case .Venusaur:
            return "Grass"
        case .Charmandar:
            return "Fire"
        case .Charmeleon:
            return "Fire"
        case .Charizard:
            return "Fire"
        case .Squirtle:
            return "Water"
        case .Wartortle:
            return "Water"
        case .Blastoise:
            return "Water"
        case .Caterpie :
            return "Bug"
        case .Metapod:
            return "Bug"
        case .Butterfree:
            return "Bug"
        }
    }
    
    var HP: String {
        
        switch self {
        case .Bulbasaur:
            return "45"
        case .Ivysaur:
            return "60"
        case .Venusaur:
            return "80"
        case .Charmandar:
            return "39"
        case .Charmeleon:
            return "58"
        case .Charizard:
            return "78"
        case .Squirtle:
            return "44"
        case .Wartortle:
            return "59"
        case .Blastoise:
            return "79"
        case .Caterpie :
            return "45"
        case .Metapod:
            return "50"
        case .Butterfree:
            return "60"
        }
    }
    
    var attack: String {
        
        switch self {
        case .Bulbasaur:
            return "49"
        case .Ivysaur:
            return "62"
        case .Venusaur:
            return "82"
        case .Charmandar:
            return "52"
        case .Charmeleon:
            return "64"
        case .Charizard:
            return "84"
        case .Squirtle:
            return "48"
        case .Wartortle:
            return "63"
        case .Blastoise:
            return "83"
        case .Caterpie :
            return "30"
        case .Metapod:
            return "20"
        case .Butterfree:
            return "45"
        }
    }
    
    var defense: String {
        
        switch self {
        case .Bulbasaur:
            return "49"
        case .Ivysaur:
            return "63"
        case .Venusaur:
            return "83"
        case .Charmandar:
            return "43"
        case .Charmeleon:
            return "58"
        case .Charizard:
            return "78"
        case .Squirtle:
            return "65"
        case .Wartortle:
            return "80"
        case .Blastoise:
            return "100"
        case .Caterpie :
            return "35"
        case .Metapod:
            return "55"
        case .Butterfree:
            return "50"
        }
    }
    
    var specialAttack: String {
        
        switch self {
        case .Bulbasaur:
            return "65"
        case .Ivysaur:
            return "80"
        case .Venusaur:
            return "100"
        case .Charmandar:
            return "60"
        case .Charmeleon:
            return "80"
        case .Charizard:
            return "109"
        case .Squirtle:
            return "50"
        case .Wartortle:
            return "65"
        case .Blastoise:
            return "85"
        case .Caterpie :
            return "20"
        case .Metapod:
            return "25"
        case .Butterfree:
            return "80"
        }
    }
    
    var specialDefense: String {
        
        switch self {
        case .Bulbasaur:
            return "65"
        case .Ivysaur:
            return "80"
        case .Venusaur:
            return "100"
        case .Charmandar:
            return "50"
        case .Charmeleon:
            return "65"
        case .Charizard:
            return "85"
        case .Squirtle:
            return "64"
        case .Wartortle:
            return "80"
        case .Blastoise:
            return "105"
        case .Caterpie :
            return "20"
        case .Metapod:
            return "25"
        case .Butterfree:
            return "80"
        }
    }
    
    var speed: String {
        
        switch self {
        case .Bulbasaur:
            return "45"
        case .Ivysaur:
            return "60"
        case .Venusaur:
            return "80"
        case .Charmandar:
            return "65"
        case .Charmeleon:
            return "80"
        case .Charizard:
            return "100"
        case .Squirtle:
            return "43"
        case .Wartortle:
            return "58"
        case .Blastoise:
            return "78"
        case .Caterpie :
            return "45"
        case .Metapod:
            return "30"
        case .Butterfree:
            return "70"
        }
    }
    
    var color: String {
        
        switch self {
        case .Bulbasaur:
            return "#20bf6bff"
        case .Ivysaur:
            return "#20bf6bff"
        case .Venusaur:
            return "#20bf6bff"
        case .Charmandar:
            return "#fd9644ff"
        case .Charmeleon:
            return "#fd9644ff"
        case .Charizard:
            return "#fd9644ff"
        case .Squirtle:
            return "#54a0ffff"
        case .Wartortle:
            return "#54a0ffff"
        case .Blastoise:
            return "#54a0ffff"
        case .Caterpie :
            return "#a8b820ff"
        case .Metapod:
            return "#a8b820ff"
        case .Butterfree:
            return "#a8b820ff"
        }
    }
}
