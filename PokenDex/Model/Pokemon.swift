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

let Charmandar = Pokemon.init(name: "Charmandar", description: "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when CHARMANDER is enjoying itself. If the POKéMON becomes enraged, the flame burns fiercely.", imageName: UIImage(named: "4")!, pokedexID: "#004", type: "Fire", HP: "39", attack: "52", defense: "43", specialAttack: "60", specialDefense: "50", speed: "65", color: UIColor(hex: "#fd9644ff"))

let Charmeleon = Pokemon.init(name: "Charmeleon", description: "CHARMELEON mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.", imageName: UIImage(named: "5")!, pokedexID: "#005", type: "Fire", HP: "58", attack: "64", defense: "58", specialAttack: "80", specialDefense: "65", speed: "80", color: UIColor(hex: "#fd9644ff"))

let Charizard = Pokemon.init(name: "Charizard", description: "CHARIZARD flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.", imageName: UIImage(named: "6")!, pokedexID: "#006", type: "Fire", HP: "78", attack: "84", defense: "78", specialAttack: "109", specialDefense: "85", speed: "100", color: UIColor(hex: "#fd9644ff"))

let Squirtle = Pokemon.init(name: "Squirtle", description: "SQUIRTLE’s shell is not merely used for protection. The shell’s rounded shape and the grooves on its surface help minimize resistance in water, enabling this POKéMON to swim at high speeds.", imageName: UIImage(named: "7")!, pokedexID: "#007", type: "Water", HP: "44", attack: "48", defense: "65", specialAttack: "50", specialDefense: "64", speed: "43", color: UIColor(hex: "#54a0ffff"))

let Wartortle = Pokemon.init(name: "Wartortle", description: "Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as WARTORTLE ages. The scratches on its shell are evidence of this POKéMON’s toughness as a battler.", imageName: UIImage(named: "8")!, pokedexID: "#008", type: "Water", HP: "59", attack: "63", defense: "80", specialAttack: "65", specialDefense: "80", speed: "58", color: UIColor(hex: "#54a0ffff"))

let Blastoise = Pokemon.init(name: "Blastoise", description: "BLASTOISE has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.", imageName: UIImage(named: "9")!, pokedexID: "#009", type: "Water", HP: "79", attack: "83", defense: "100", specialAttack: "85", specialDefense: "105", speed: "78", color: UIColor(hex: "#54a0ffff"))

let Caterpie = Pokemon.init(name: "Caterpie", description: "CATERPIE has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this POKéMON releases a terrifically strong odor.", imageName: UIImage(named: "10")!, pokedexID: "#010", type: "Bug", HP: "45", attack: "30", defense: "35", specialAttack: "20", specialDefense: "20", speed: "45", color: UIColor(hex: "#a8b820ff"))

let Metapod = Pokemon.init(name: "Metapod", description: "The shell covering this POKéMON’s body is as hard as an iron slab. METAPOD does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.", imageName: UIImage(named: "11")!, pokedexID: "#011", type: "Bug", HP: "50", attack: "20", defense: "55", specialAttack: "25", specialDefense: "25", speed: "30", color: UIColor(hex: "#a8b820ff"))

let Butterfree = Pokemon.init(name: "Butterfree", description: "BUTTERFREE has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.", imageName: UIImage(named: "12")!, pokedexID: "#012", type: "Bug", HP: "60", attack: "45", defense: "50", specialAttack: "90", specialDefense: "80", speed: "70", color: UIColor(hex: "#a8b820ff"))

let Pidgeot = Pokemon.init(name: "Pidgeot", description: "This POKéMON has a dazzling plumage of beautifully glossy feathers. Many TRAINERS are captivated by the striking beauty of the feathers on its head, compelling them to choose PIDGEOT as their POKéMON.", imageName: UIImage(named: "18")!, pokedexID: "#018", type: "Flying", HP: "83", attack: "80", defense: "75", specialAttack: "70", specialDefense: "70", speed: "101", color: UIColor(hex: "#a890f0ff"))

let Pikachu = Pokemon.init(name: "Pikachu", description: "Whenever PIKACHU comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it’s evidence that this POKéMON mistook the intensity of its charge.", imageName: UIImage(named: "25")!, pokedexID: "#025", type: "Electric", HP: "35", attack: "55", defense: "40", specialAttack: "50", specialDefense: "50", speed: "90", color: UIColor(hex: "#ffdd59ff"))

let Raichu = Pokemon.init(name: "Raichu", description: "If the electrical sacks become excessively charged, RAICHU plants its tail in the ground and discharges. Scorched patches of ground will be found near this POKéMON’s nest.", imageName: UIImage(named: "26")!, pokedexID: "#026", type: "Electric", HP: "60", attack: "90", defense: "55", specialAttack: "90", specialDefense: "80", speed: "110", color: UIColor(hex: "#ffdd59ff"))

let Nidoking = Pokemon.init(name: "Nidoking", description: "NIDOKING’s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this POKéMON goes on a rampage, there is no stopping it.", imageName: UIImage(named: "34")!, pokedexID: "#034", type: "Poison", HP: "81", attack: "102", defense: "77", specialAttack: "85", specialDefense: "75", speed: "85", color: UIColor(hex: "#a040a0ff"))

let Gengar = Pokemon.init(name: "Gengar", description: "Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a GENGAR running past you, pretending to be your shadow.", imageName: UIImage(named: "94")!, pokedexID: "#094", type: "Ghost", HP: "60", attack: "65", defense: "60", specialAttack: "130", specialDefense: "75", speed: "110", color: UIColor(hex: "#705898ff"))

let Onix = Pokemon.init(name: "Onix", description: "ONIX has a magnet in its brain. It acts as a compass so that this POKéMON does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.", imageName: UIImage(named: "95")!, pokedexID: "#095", type: "Rock", HP: "35", attack: "45", defense: "160", specialAttack: "30", specialDefense: "45", speed: "70", color: UIColor(hex: "#b8a038ff"))

let Steelix = Pokemon.init(name: "Steelix", description: "STEELIX lives even further underground than ONIX. This POKéMON is known to dig towards the earth’s core. There are records of this POKéMON reaching a depth of over six-tenths of a mile underground.", imageName: UIImage(named: "208")!, pokedexID: "#208", type: "Steel", HP: "75", attack: "85", defense: "200", specialAttack: "55", specialDefense: "65", speed: "30", color: UIColor(hex: "#b8b8d0ff"))

let Eevee = Pokemon.init(name: "Eevee", description: "EEVEE has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various STONES causes this POKéMON to evolve.", imageName: UIImage(named: "133")!, pokedexID: "#133", type: "Normal", HP: "55", attack: "55", defense: "50", specialAttack: "45", specialDefense: "65", speed: "55", color: UIColor(hex: "#a8a878ff"))

let Umbreon = Pokemon.init(name: "Umbreon", description: "UMBREON evolved as a result of exposure to the moon’s waves. It hides silently in darkness and waits for its foes to make a move. The rings on its body glow when it leaps to attack.", imageName: UIImage(named: "197")!, pokedexID: "#197", type: "Dark", HP: "95", attack: "65", defense: "110", specialAttack: "60", specialDefense: "130", speed: "65", color: UIColor(hex: "#705848ff"))

let Articuno = Pokemon.init(name: "Articuno", description: "ARTICUNO is a legendary bird POKéMON that can control ice. The flapping of its wings chills the air. As a result, it is said that when this POKéMON flies, snow will fall.", imageName: UIImage(named: "144")!, pokedexID: "#144", type: "Ice", HP: "90", attack: "85", defense: "100", specialAttack: "95", specialDefense: "125", speed: "85", color: UIColor(hex: "#98d8d8ff"))

let Dragonite = Pokemon.init(name: "Dragonite", description: "DRAGONITE is capable of circling the globe in just sixteen hours. It is a kindhearted POKéMON that leads lost and foundering ships in a storm to the safety of land.", imageName: UIImage(named: "149")!, pokedexID: "#149", type: "Dragon", HP: "91", attack: "134", defense: "95", specialAttack: "100", specialDefense: "100", speed: "80", color: UIColor(hex: "#7038f8ff"))

let Mewtwo = Pokemon.init(name: "Mewtwo", description: "MEWTWO is a POKéMON that was created by genetic manipulation. However, even though the scientific power of humans created this POKéMON’s body, they failed to endow MEWTWO with a compassionate heart.", imageName: UIImage(named: "150")!, pokedexID: "#150", type: "Psychic", HP: "106", attack: "110", defense: "90", specialAttack: "154", specialDefense: "90", speed: "130", color: UIColor(hex: "#f368e0ff"))

let Tyranitar = Pokemon.init(name: "Tyranitar", description: "TYRANITAR is so overwhelmingly powerful, it can bring down a whole mountain to make its nest. This POKéMON wanders about in mountains seeking new opponents to fight.", imageName: UIImage(named: "248")!, pokedexID: "#248", type: "Rock", HP: "100", attack: "134", defense: "110", specialAttack: "95", specialDefense: "100", speed: "61", color: UIColor(hex: "#b8a038ff"))

let Groudon = Pokemon.init(name: "Groudon", description: "GROUDON has long been described in mythology as the POKéMON that raised lands and expanded continents. This POKéMON took to sleep after a cataclysmic battle with KYOGRE.", imageName: UIImage(named: "383")!, pokedexID: "#383", type: "Ground", HP: "100", attack: "150", defense: "140", specialAttack: "100", specialDefense: "90", speed: "90", color: UIColor(hex: "#e0c068ff"))

let Kyogre = Pokemon.init(name: "Kyogre", description: "KYOGRE has the power to create massive rain clouds that cover the entire sky and bring about torrential downpours. This POKéMON saved people who were suffering from droughts.", imageName: UIImage(named: "382")!, pokedexID: "#382", type: "Water", HP: "100", attack: "100", defense: "90", specialAttack: "150", specialDefense: "140", speed: "90", color: UIColor(hex: "#54a0ffff"))

let Lucario = Pokemon.init(name: "Lucario", description: "By catching the aura emanating from others, it can read their thoughts and movements.", imageName: UIImage(named: "448")!, pokedexID: "#448", type: "Fighting", HP: "70", attack: "110", defense: "70", specialAttack: "115", specialDefense: "70", speed: "90", color: UIColor(hex: "#c03028ff"))

let Xerneas = Pokemon.init(name: "Xerneas", description: "Legends say it can share eternal life. It slept for a thousand years in the form of a tree before its revival.", imageName: UIImage(named: "716")!, pokedexID: "#716", type: "Fairy", HP: "126", attack: "131", defense: "95", specialAttack: "131", specialDefense: "98", speed: "99", color: UIColor(hex: "#ee99acff"))



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
