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
            return "001"
        case .Ivysaur:
            return "002"
        case .Venusaur:
            return "003"
        case .Charmandar:
            return "004"
        case .Charmeleon:
            return "005"
        case .Charizard:
            return "006"
        case .Squirtle:
            return "007"
        case .Wartortle:
            return "008"
        case .Blastoise:
            return "009"
        case .Caterpie :
            return "010"
        case .Metapod:
            return "011"
        case .Butterfree:
            return "012"
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
    
    var height: String {
        
        switch self {
        case .Bulbasaur:
            return "2.4"
        case .Ivysaur:
            return "3.03"
        case .Venusaur:
            return "6.07"
        case .Charmandar:
            return "2"
        case .Charmeleon:
            return "3.07"
        case .Charizard:
            return "5.07"
        case .Squirtle:
            return "1.08"
        case .Wartortle:
            return "3.03"
        case .Blastoise:
            return "5.03"
        case .Caterpie :
            return "1"
        case .Metapod:
            return "2.04"
        case .Butterfree:
            return "3.07"
        }
    }
    
    var weight: String {
        
        switch self {
        case .Bulbasaur:
            return "15.2"
        case .Ivysaur:
            return "28.7"
        case .Venusaur:
            return "220.5"
        case .Charmandar:
            return "18.7"
        case .Charmeleon:
            return "41.9"
        case .Charizard:
            return "199.5"
        case .Squirtle:
            return "19.8"
        case .Wartortle:
            return "49.6"
        case .Blastoise:
            return "188.5"
        case .Caterpie :
            return "6.4"
        case .Metapod:
            return "21.8"
        case .Butterfree:
            return "70.5"
        }
    }
    
    var evolutionOneImage: String {
        
        switch self {
        case .Bulbasaur:
            return "2"
        case .Ivysaur:
            return "1"
        case .Venusaur:
            return "1"
        case .Charmandar:
            return "5"
        case .Charmeleon:
            return "4"
        case .Charizard:
            return "4"
        case .Squirtle:
            return "8"
        case .Wartortle:
            return "7"
        case .Blastoise:
            return "7"
        case .Caterpie :
            return "11"
        case .Metapod:
            return "10"
        case .Butterfree:
            return "10"
        }
    }
    
    var evolutionTwoImage: String {
        
        switch self {
        case .Bulbasaur:
            return "3"
        case .Ivysaur:
            return "3"
        case .Venusaur:
            return "2"
        case .Charmandar:
            return "6"
        case .Charmeleon:
            return "6"
        case .Charizard:
            return "5"
        case .Squirtle:
            return "9"
        case .Wartortle:
            return "9"
        case .Blastoise:
            return "8"
        case .Caterpie :
            return "12"
        case .Metapod:
            return "12"
        case .Butterfree:
            return "11"
        }
    }
}
