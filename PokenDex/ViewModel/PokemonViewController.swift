//
//  PokemonViewController.swift
//  PokenDex
//
//  Created by Sabih on 21/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
//
class PokemonViewController: UIViewController {

    var selectedPokemon: (title: String, description: String, image: UIImage?, id: String, type: String, attack: String, defense: String)?
    
    @IBOutlet weak var pokemonTitle: UILabel!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedPokemon = selectedPokemon {
            pokemonTitle.text = selectedPokemon.title
            pokemonImage.image = selectedPokemon.image
            pokemonDescription.text = selectedPokemon.description
            pokemonType.text = selectedPokemon.type
            pokemonID.text = selectedPokemon.id
            pokemonAttack.text = selectedPokemon.attack
            pokemonDefense.text = selectedPokemon.defense
        }
    }
}
