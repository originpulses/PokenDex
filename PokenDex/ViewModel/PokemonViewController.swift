//
//  PokemonViewController.swift
//  PokenDex
//
//  Created by Sabih on 21/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var selectedPokemon: (title: String, description: String, image: UIImage?, id: String, type: String, attack: String, defense: String, height: String, weight: String, evolutionOne: UIImage?, evolutionTwo: UIImage?)?

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var evolutionOne: UIImageView!
    @IBOutlet weak var evolutionTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedPokemon = selectedPokemon {
            pokemonImage.image = selectedPokemon.image
            pokemonDescription.text = selectedPokemon.description
            pokemonType.text = selectedPokemon.type
            pokemonID.text = selectedPokemon.id
            pokemonHeight.text = selectedPokemon.height
            pokemonAttack.text = selectedPokemon.attack
            pokemonWeight.text = selectedPokemon.weight
            pokemonDefense.text = selectedPokemon.defense
            evolutionOne.image = selectedPokemon.evolutionOne
            evolutionTwo.image = selectedPokemon.evolutionTwo
        }
    }
}
