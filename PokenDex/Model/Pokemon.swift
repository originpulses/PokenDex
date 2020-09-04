//
//  Pokemon.swift
//  PokenDex
//
//  Created by Sabih on 20/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
import Foundation


struct Pokemon {
    
    var name: String
    var imageName: UIImage?
    var description: String
    var pokedexID: String
    var type: String
    var HP: String
    var attack: String
    var defense: String
    var specialAttack: String
    var specialDefense: String
    var speed: String
    var color: UIColor?
    
    init(name: String, description: String, imageName: UIImage?, pokedexID: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, color: UIColor?) {
        
        self.name = name
        self.description = description
        self.imageName = imageName
        self.pokedexID = pokedexID
        self.type = type
        self.HP = HP
        self.attack = attack
        self.defense = defense
        self.specialAttack = specialAttack
        self.specialDefense = specialDefense
        self.speed = speed
        self.color = color
    }
}

// Initializing our Pokemon data which is realistic as in PokeAPI

let Bulbasaur = Pokemon.init(name: "Bulbasaur", description: "BULBASAUR can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.", imageName: UIImage(named: "1")!, pokedexID: "#001", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Ivysaur = Pokemon.init(name: "Ivysaur", description: "There is a bud on this POKéMON’s back.To support its weight, IVYSAUR’s legs and trunk grow thick and strong.If it starts spending more time lying in the sunlight, it’s a sign that the bud will bloom into a large flower soon.", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "60", attack: "62", defense: "63", specialAttack: "80", specialDefense: "80", speed: "60", color: UIColor(hex: "#20bf6bff"))

let Venusaur = Pokemon.init(name: "Venusaur", description: "There is a large flower on VENUSAUR’s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower’s aroma soothes the emotions of people.", imageName: UIImage(named: "3")!, pokedexID: "#003", type: "Grass", HP: "80", attack: "82", defense: "83", specialAttack: "100", specialDefense: "100", speed: "80", color: UIColor(hex: "#20bf6bff"))

let Charmandar = Pokemon.init(name: "Charmandar", description: "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when CHARMANDER is enjoying itself. If the POKéMON becomes enraged, the flame burns fiercely.", imageName: UIImage(named: "4")!, pokedexID: "#004", type: "Fire", HP: "39", attack: "52", defense: "43", specialAttack: "60", specialDefense: "50", speed: "65", color: UIColor(hex: "#20bf6bff"))

let Charmeleon = Pokemon.init(name: "Charmeleon", description: "CHARMELEON mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.", imageName: UIImage(named: "5")!, pokedexID: "#005", type: "Fire", HP: "58", attack: "64", defense: "58", specialAttack: "80", specialDefense: "65", speed: "80", color: UIColor(hex: "#20bf6bff"))

let Charizard = Pokemon.init(name: "Charizard", description: "CHARIZARD flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.", imageName: UIImage(named: "6")!, pokedexID: "#006", type: "Fire", HP: "78", attack: "84", defense: "78", specialAttack: "109", specialDefense: "85", speed: "100", color: UIColor(hex: "#20bf6bff"))

let Squirtle = Pokemon.init(name: "Squirtle", description: "SQUIRTLE’s shell is not merely used for protection. The shell’s rounded shape and the grooves on its surface help minimize resistance in water, enabling this POKéMON to swim at high speeds.", imageName: UIImage(named: "7")!, pokedexID: "#007", type: "Water", HP: "44", attack: "48", defense: "65", specialAttack: "50", specialDefense: "64", speed: "43", color: UIColor(hex: "#20bf6bff"))

let Wartortle = Pokemon.init(name: "Wartortle", description: "Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as WARTORTLE ages. The scratches on its shell are evidence of this POKéMON’s toughness as a battler.", imageName: UIImage(named: "8")!, pokedexID: "#008", type: "Water", HP: "59", attack: "63", defense: "80", specialAttack: "65", specialDefense: "80", speed: "58", color: UIColor(hex: "#20bf6bff"))

let Blastoise = Pokemon.init(name: "Blastoise", description: "BLASTOISE has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.", imageName: UIImage(named: "9")!, pokedexID: "#009", type: "Water", HP: "79", attack: "83", defense: "100", specialAttack: "85", specialDefense: "105", speed: "78", color: UIColor(hex: "#20bf6bff"))

let Caterpie = Pokemon.init(name: "Caterpie", description: "CATERPIE has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this POKéMON releases a terrifically strong odor.", imageName: UIImage(named: "10")!, pokedexID: "#010", type: "Bug", HP: "45", attack: "30", defense: "35", specialAttack: "20", specialDefense: "20", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Metapod = Pokemon.init(name: "Metapod", description: "The shell covering this POKéMON’s body is as hard as an iron slab. METAPOD does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.", imageName: UIImage(named: "11")!, pokedexID: "#011", type: "Bug", HP: "50", attack: "20", defense: "55", specialAttack: "25", specialDefense: "25", speed: "30", color: UIColor(hex: "#20bf6bff"))

let Butterfree = Pokemon.init(name: "Butterfree", description: "BUTTERFREE has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.", imageName: UIImage(named: "12")!, pokedexID: "#012", type: "Bug", HP: "60", attack: "45", defense: "50", specialAttack: "90", specialDefense: "80", speed: "70", color: UIColor(hex: "#20bf6bff"))

let Pidgeot = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Pikachu = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Raichu = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Nidoking = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Gengar = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Onix = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Steelix = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Eevee = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Umbreon = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Articuno = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Dragonite = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Mewtwo = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Tyranitar = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Groudon = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Kyogre = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Lucario = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))

let Xerneas = Pokemon.init(name: "", description: "", imageName: UIImage(named: "2")!, pokedexID: "#002", type: "Grass", HP: "45", attack: "49", defense: "49", specialAttack: "65", specialDefense: "65", speed: "45", color: UIColor(hex: "#20bf6bff"))



// Hex codes
// Grass = #20bf6bff
// Fire = #fd9644ff
// Water = #54a0ffff
// Bug = #a8b820ff
// Flying = #a890f0ff
// Electric = #ffdd59ff
// Poison = #a040a0ff
// Ghost = #705898ff
// Steel = #b8b8d0ff
// Normal = #a8a878ff
// Dark = #705848ff
// Ice = #98d8d8ff
// Dragon = #7038f8ff
// Psychic = #f368e0ff
// Rock = #b8a038ff
// Ground = #e0c068ff
// Fighting = #c03028ff
// Fairy = #ee99acff




//enum Pokemon: String {
//
//    case Bulbasaur = "Bulbasaur", Ivysaur = "Ivysaur", Venusaur = "Venusaur", Charmandar = "Charmandar", Charmeleon = "Charmeleon", Charizard = "Charizard", Squirtle = "Squirtle", Wartortle = "Wartortle", Blastoise = "Blastoise", Caterpie = "Caterpie", Metapod = "Metapod", Butterfree = "Butterfree"
//
//    var imageName: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "1"
//        case .Ivysaur:
//            return "2"
//        case .Venusaur:
//            return "3"
//        case .Charmandar:
//            return "4"
//        case .Charmeleon:
//            return "5"
//        case .Charizard:
//            return "6"
//        case .Squirtle:
//            return "7"
//        case .Wartortle:
//            return "8"
//        case .Blastoise:
//            return "9"
//        case .Caterpie :
//            return "10"
//        case .Metapod:
//            return "11"
//        case .Butterfree:
//            return "12"
//        }
//    }
//
//    var description: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "A young Bulbasaur uses the nutrients from it's seed for the energy it needs to grow"
//        case .Ivysaur:
//            return "The stronger the sunlight it absorbs, the stronger this Pokemon becomes"
//        case .Venusaur:
//            return "Venusaur uses its large petals to capture sunlight and transform into energy"
//        case .Charmandar:
//            return "The flame that burns at the tip of its tail is an indication of its emotions"
//        case .Charmeleon:
//            return "When it swings its burning tail, it elevates the temprature to unbearably high levels"
//        case .Charizard:
//            return "Spits fire that is hot enough to melt boulders, Known to cause forest fires unintenionally"
//        case .Squirtle:
//            return "Shoots water at prey while in the water. Withdraws into its shell when in danger"
//        case .Wartortle:
//            return "Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance"
//        case .Blastoise:
//            return "Once it takes aim at its enemy, it blasts out water with even more force than a fire hose"
//        case .Caterpie :
//            return "Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls"
//        case .Metapod:
//            return "Hardens its shell to protect itself"
//        case .Butterfree:
//            return "In battle, it flaps its wings at high speed to release highly toxic dust into the air"
//        }
//    }
//
//    var pokedexID: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "#001"
//        case .Ivysaur:
//            return "#002"
//        case .Venusaur:
//            return "#003"
//        case .Charmandar:
//            return "#004"
//        case .Charmeleon:
//            return "#005"
//        case .Charizard:
//            return "#006"
//        case .Squirtle:
//            return "#007"
//        case .Wartortle:
//            return "#008"
//        case .Blastoise:
//            return "#009"
//        case .Caterpie :
//            return "#010"
//        case .Metapod:
//            return "#011"
//        case .Butterfree:
//            return "#012"
//        }
//    }
//
//    var type: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "Grass"
//        case .Ivysaur:
//            return "Grass"
//        case .Venusaur:
//            return "Grass"
//        case .Charmandar:
//            return "Fire"
//        case .Charmeleon:
//            return "Fire"
//        case .Charizard:
//            return "Fire"
//        case .Squirtle:
//            return "Water"
//        case .Wartortle:
//            return "Water"
//        case .Blastoise:
//            return "Water"
//        case .Caterpie :
//            return "Bug"
//        case .Metapod:
//            return "Bug"
//        case .Butterfree:
//            return "Bug"
//        }
//    }
//
//    var HP: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "45"
//        case .Ivysaur:
//            return "60"
//        case .Venusaur:
//            return "80"
//        case .Charmandar:
//            return "39"
//        case .Charmeleon:
//            return "58"
//        case .Charizard:
//            return "78"
//        case .Squirtle:
//            return "44"
//        case .Wartortle:
//            return "59"
//        case .Blastoise:
//            return "79"
//        case .Caterpie :
//            return "45"
//        case .Metapod:
//            return "50"
//        case .Butterfree:
//            return "60"
//        }
//    }
//
//    var attack: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "49"
//        case .Ivysaur:
//            return "62"
//        case .Venusaur:
//            return "82"
//        case .Charmandar:
//            return "52"
//        case .Charmeleon:
//            return "64"
//        case .Charizard:
//            return "84"
//        case .Squirtle:
//            return "48"
//        case .Wartortle:
//            return "63"
//        case .Blastoise:
//            return "83"
//        case .Caterpie :
//            return "30"
//        case .Metapod:
//            return "20"
//        case .Butterfree:
//            return "45"
//        }
//    }
//
//    var defense: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "49"
//        case .Ivysaur:
//            return "63"
//        case .Venusaur:
//            return "83"
//        case .Charmandar:
//            return "43"
//        case .Charmeleon:
//            return "58"
//        case .Charizard:
//            return "78"
//        case .Squirtle:
//            return "65"
//        case .Wartortle:
//            return "80"
//        case .Blastoise:
//            return "100"
//        case .Caterpie :
//            return "35"
//        case .Metapod:
//            return "55"
//        case .Butterfree:
//            return "50"
//        }
//    }
//
//    var specialAttack: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "65"
//        case .Ivysaur:
//            return "80"
//        case .Venusaur:
//            return "100"
//        case .Charmandar:
//            return "60"
//        case .Charmeleon:
//            return "80"
//        case .Charizard:
//            return "109"
//        case .Squirtle:
//            return "50"
//        case .Wartortle:
//            return "65"
//        case .Blastoise:
//            return "85"
//        case .Caterpie :
//            return "20"
//        case .Metapod:
//            return "25"
//        case .Butterfree:
//            return "80"
//        }
//    }
//
//    var specialDefense: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "65"
//        case .Ivysaur:
//            return "80"
//        case .Venusaur:
//            return "100"
//        case .Charmandar:
//            return "50"
//        case .Charmeleon:
//            return "65"
//        case .Charizard:
//            return "85"
//        case .Squirtle:
//            return "64"
//        case .Wartortle:
//            return "80"
//        case .Blastoise:
//            return "105"
//        case .Caterpie :
//            return "20"
//        case .Metapod:
//            return "25"
//        case .Butterfree:
//            return "80"
//        }
//    }
//
//    var speed: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "45"
//        case .Ivysaur:
//            return "60"
//        case .Venusaur:
//            return "80"
//        case .Charmandar:
//            return "65"
//        case .Charmeleon:
//            return "80"
//        case .Charizard:
//            return "100"
//        case .Squirtle:
//            return "43"
//        case .Wartortle:
//            return "58"
//        case .Blastoise:
//            return "78"
//        case .Caterpie :
//            return "45"
//        case .Metapod:
//            return "30"
//        case .Butterfree:
//            return "70"
//        }
//    }
//
//    var color: String {
//
//        switch self {
//        case .Bulbasaur:
//            return "#20bf6bff"
//        case .Ivysaur:
//            return "#20bf6bff"
//        case .Venusaur:
//            return "#20bf6bff"
//        case .Charmandar:
//            return "#fd9644ff"
//        case .Charmeleon:
//            return "#fd9644ff"
//        case .Charizard:
//            return "#fd9644ff"
//        case .Squirtle:
//            return "#54a0ffff"
//        case .Wartortle:
//            return "#54a0ffff"
//        case .Blastoise:
//            return "#54a0ffff"
//        case .Caterpie :
//            return "#a8b820ff"
//        case .Metapod:
//            return "#a8b820ff"
//        case .Butterfree:
//            return "#a8b820ff"
//        }
//    }
//}
