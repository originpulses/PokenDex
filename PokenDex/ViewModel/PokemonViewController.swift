//
//  PokemonViewController.swift
//  PokenDex
//
//  Created by Sabih on 21/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    var selectedPokemon: (title: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String)?
    
    var desVC: DescriptionViewController?
    var statsVC: StatsViewController?
    
    @IBOutlet weak var pokemonTitle: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var statsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedPokemon = selectedPokemon,
            let dVC = desVC,
            let sVC = statsVC {
            pokemonTitle.text = selectedPokemon.title
            pokemonImage.image = selectedPokemon.image
            pokemonType.text = selectedPokemon.type
            pokemonID.text = selectedPokemon.id
            dVC.pokemonDescription.text = selectedPokemon.description
            //sVC.pokemonHP.text = selectedPokemon.HP
            sVC.pokemonAttack.text = selectedPokemon.attack
            sVC.pokemonDefense.text = selectedPokemon.defense
            //sVC.pokemonSpecialAttack.text = selectedPokemon.specialAttack
            //sVC.pokemonSpecialDefense.text = selectedPokemon.specialDefense
            //sVC.pokemonSpeed.text = selectedPokemon.speed
            
            
//            pokemonAttack.setProgress((Float(selectedPokemon.attack)!/500), animated: false)
//            pokemonDefense.setProgress((Float(selectedPokemon.defense)!/500), animated: false)
//            attackValue.text = selectedPokemon.attack
//            defenseValue.text = selectedPokemon.defense
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DescriptionViewController {
            desVC = vc
        }
        if let vc = segue.destination as? StatsViewController {
            statsVC = vc
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            descriptionView.isHidden = false
            statsView.isHidden = true
        } else {
            descriptionView.isHidden = true
            statsView.isHidden = false
        }
    }
}
