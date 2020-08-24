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
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonAttack: UIProgressView!
    @IBOutlet weak var pokemonDefense: UIProgressView!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var attackValue: UILabel!
    @IBOutlet weak var defenseValue: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedPokemon = selectedPokemon {
            pokemonTitle.text = selectedPokemon.title
            pokemonImage.image = selectedPokemon.image
            pokemonDescription.text = selectedPokemon.description
            pokemonType.text = selectedPokemon.type
            pokemonID.text = selectedPokemon.id
            pokemonAttack.setProgress((Float(selectedPokemon.attack)!/500), animated: false)
            pokemonDefense.setProgress((Float(selectedPokemon.defense)!/500), animated: false)
            attackValue.text = selectedPokemon.attack
            defenseValue.text = selectedPokemon.defense
        }
    }
}
