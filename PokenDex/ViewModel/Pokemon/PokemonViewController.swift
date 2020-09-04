//
//  PokemonViewController.swift
//  PokenDex
//
//  Created by Sabih on 21/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    var selectedPokemon: (name: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, colour: UIColor?)?
    
    var desVC: DescriptionViewController?
    var statsVC: StatsViewController?
    
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()

        if let selectedPokemon = selectedPokemon,
            let dVC = desVC,
            let sVC = statsVC {
            pokemonName.text = selectedPokemon.name
            pokemonImage.image = selectedPokemon.image
            pokemonType.text = selectedPokemon.type
            pokemonID.text = selectedPokemon.id
            dVC.pokemonDescription.text = selectedPokemon.description
            sVC.pokemonHP.text = selectedPokemon.HP
            sVC.pokemonAttack.text = selectedPokemon.attack
            sVC.pokemonDefense.text = selectedPokemon.defense
            sVC.pokemonSpecialAttack.text = selectedPokemon.specialAttack
            sVC.pokemonSpecialDefense.text = selectedPokemon.specialDefense
            sVC.pokemonSpeed.text = selectedPokemon.speed
            sVC.HPProgress.setProgress((Float(selectedPokemon.HP)!/300), animated: false)
            sVC.HPProgress.tintColor = selectedPokemon.colour
            sVC.attackProgress.setProgress((Float(selectedPokemon.attack)!/300), animated: false)
            sVC.attackProgress.tintColor = selectedPokemon.colour
            sVC.defenseProgress.setProgress((Float(selectedPokemon.defense)!/300), animated: false)
            sVC.defenseProgress.tintColor = selectedPokemon.colour
            sVC.specialAttackProgress.setProgress((Float(selectedPokemon.specialAttack)!/300), animated: false)
            sVC.specialAttackProgress.tintColor = selectedPokemon.colour
            sVC.specialDefenseProgress.setProgress((Float(selectedPokemon.specialDefense)!/300), animated: false)
            sVC.specialDefenseProgress.tintColor = selectedPokemon.colour
            sVC.speedProgress.setProgress((Float(selectedPokemon.speed)!/300), animated: false)
            sVC.speedProgress.tintColor = selectedPokemon.colour
            backgroundView.backgroundColor = selectedPokemon.colour
            segmentedControl.tintColor = selectedPokemon.colour
        }
    }
    
    func setCornerRadius() {
        self.detailView.layer.cornerRadius = self.view.bounds.height*4/100
        self.detailView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
