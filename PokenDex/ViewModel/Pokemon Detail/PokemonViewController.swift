//
//  PokemonViewController.swift
//  PokenDex
//
//  Created by Sabih on 21/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//
//
import UIKit

class PokemonViewController: UIViewController {
    
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
    
    var id: Int = 0
    
    let service = PokendexService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
        getPokemon(url: "https://pokeapi.co/api/v2/pokemon/\(id)") // Retrieves Pokemon through passed ID from PokedexController
    }
    
    // Sets All Details of Pokemon
    var pokemonDetailViewModel: PokemonDetailViewModel! {
        didSet {
            setPokemonImage()
            setPokemonData()
            setPokemonStatus()
            setPokemonTypes()
            setPokemonColor()
            if let specieUrl = pokemonDetailViewModel.pokemonDetail.species?.url {
                getSpecie(url: specieUrl)
            }
        }
    }
    
    // Sets Pokemon Description
    var specieDetailViewModel: SpecieDetailViewModel! {
        didSet {
            if let dVC = self.desVC {
                dVC.pokemonDescription.text = specieDetailViewModel.getDataDescription().capitalizingFirstLetter()
            }
        }
    }
    
    
    //  Setting upper corner radius of the "white coloured detailed view"
    func setCornerRadius() {
        detailView.layer.cornerRadius = self.view.bounds.height*4/100
        detailView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // Makes a GET request for details of Pokemon and maps them to PokemonDetailViewModel
    func getPokemon(url: String) {
        service.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                    self.pokemonDetailViewModel = PokemonDetailViewModel(pokemonDetail: (data?.toModel())!)
                } else {
                    self.showAlert(title: "Error", message: "Not return any pokemon")
                }
            case .failure(let error):
                self.showAlert(title: "Error", message: "Error - \n\(error)")
                print(error.localizedDescription)
            }
        }
    }
    
    // Makes a GET request for Specie (Description) and maps it to SpecieDetailViewModel
    func getSpecie(url: String) {
        service.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                    self.specieDetailViewModel = SpecieDetailViewModel(specieDetail: (data?.toModel())!)
                } else {
                    self.showAlert(title: "Error", message: "Not return any pokemon")
                }
            case .failure(let error):
                self.showAlert(title: "Error", message: "Error - \n\(error)")
            }
        }
    }
    
    // Kingfisher is a 3rd Party Framework that retrieves Pokemon Image and sets it to ImageView with the help of a URL
    private func setPokemonImage() {
        if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format: "%03d", id)).png") {
            pokemonImage.kf.setImage(with: url)
        }
    }
    
    // Retrieves mapped information from PokemonDetailViewModel and assigns it to the labels
    private func setPokemonData() {
        if let name = pokemonDetailViewModel.pokemonDetail.name {
            pokemonName.text = name.capitalizingFirstLetter()
        }
        
        if let id = pokemonDetailViewModel.pokemonDetail.id {
            pokemonID.text = "#\(String(format: "%03d", id))"
            
        }
    }
    
    private func setPokemonStatus() {
        let stats = pokemonDetailViewModel.pokemonDetail.stats
        for stat in stats! {
            let name = stat.stat?.name!
            
            if (name?.elementsEqual("hp"))! {
                if let base_stat = stat.base_stat, let sVC = self.statsVC {
                    sVC.pokemonHP.text = "\(base_stat)"
                    sVC.HPProgress.setProgress(((sVC.pokemonHP.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("defense"))! {
                if let base_stat = stat.base_stat, let sVC = self.statsVC {
                    sVC.pokemonDefense.text = "\(base_stat)"
                    sVC.defenseProgress.setProgress(((sVC.pokemonDefense.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("attack"))! {
                if let base_stat = stat.base_stat, let sVC = self.statsVC {
                    sVC.pokemonAttack.text = "\(base_stat)"
                    sVC.attackProgress.setProgress(((sVC.pokemonAttack.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("special-attack"))! {
                if let base_stat = stat.base_stat, let sVC = self.statsVC {
                    sVC.pokemonSpecialAttack.text = "\(base_stat)"
                    sVC.specialAttackProgress.setProgress(((sVC.pokemonSpecialAttack.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("special-defense"))! {
                if let base_stat = stat.base_stat, let sVC = self.statsVC {
                    sVC.pokemonSpecialDefense.text = "\(base_stat)"
                    sVC.specialDefenseProgress.setProgress(((sVC.pokemonSpecialDefense.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("speed"))! {
                if let base_stat = stat.base_stat, let sVC = self.statsVC {
                    sVC.pokemonSpeed.text = "\(base_stat)"
                    sVC.speedProgress.setProgress(((sVC.pokemonSpeed.text?.floatValue())!/300), animated: false)
                }
            } else {
                showAlert(title: "Error", message: "Unknown Error")
            }
        }
    }
    
    private func setPokemonTypes() {
        let type = pokemonDetailViewModel.pokemonDetail.types?.first
        if let type = type?.type?.name {
            pokemonType.text = type.capitalizingFirstLetter()
        }
    }
    
    // Since there is no color information in PokeAPI we have to manually set the colour of each type Pokemon
    private func setPokemonColor() {
        let colorOfType = pokemonDetailViewModel.pokemonDetail.types?.first
        if let colorOfType = colorOfType?.type?.name, let sVC = self.statsVC {
            if colorOfType == "normal" {
                let normal = UIColor(hex: "#a8a878ff")
                backgroundView.backgroundColor = normal
                sVC.HPProgress.tintColor = normal
                sVC.attackProgress.tintColor = normal
                sVC.defenseProgress.tintColor = normal
                sVC.specialAttackProgress.tintColor = normal
                sVC.specialDefenseProgress.tintColor = normal
                sVC.speedProgress.tintColor = normal
                segmentedControl.tintColor = normal
            } else if colorOfType == "fire" {
                let fire = UIColor(hex: "#fd9644ff")
                backgroundView.backgroundColor = fire
                sVC.HPProgress.tintColor = fire
                sVC.attackProgress.tintColor = fire
                sVC.defenseProgress.tintColor = fire
                sVC.specialAttackProgress.tintColor = fire
                sVC.specialDefenseProgress.tintColor = fire
                sVC.speedProgress.tintColor = fire
                segmentedControl.tintColor = fire
            } else if colorOfType == "water" {
                let water = UIColor(hex: "#54a0ffff")
                backgroundView.backgroundColor = water
                sVC.HPProgress.tintColor = water
                sVC.attackProgress.tintColor = water
                sVC.defenseProgress.tintColor = water
                sVC.specialAttackProgress.tintColor = water
                sVC.specialDefenseProgress.tintColor = water
                sVC.speedProgress.tintColor = water
                segmentedControl.tintColor = water
            } else if colorOfType == "grass" {
                let grass = UIColor(hex: "#20bf6bff")
                backgroundView.backgroundColor = grass
                sVC.HPProgress.tintColor = grass
                sVC.attackProgress.tintColor = grass
                sVC.defenseProgress.tintColor = grass
                sVC.specialAttackProgress.tintColor = grass
                sVC.specialDefenseProgress.tintColor = grass
                sVC.speedProgress.tintColor = grass
                segmentedControl.tintColor = grass
            } else if colorOfType == "electric" {
                let electric = UIColor(hex: "#f3ca3eff")
                backgroundView.backgroundColor = electric
                sVC.HPProgress.tintColor = electric
                sVC.attackProgress.tintColor = electric
                sVC.defenseProgress.tintColor = electric
                sVC.specialAttackProgress.tintColor = electric
                sVC.specialDefenseProgress.tintColor = electric
                sVC.speedProgress.tintColor = electric
                segmentedControl.tintColor = electric
            } else if colorOfType == "ice" {
                let ice = UIColor(hex: "#98d8d8ff")
                backgroundView.backgroundColor = ice
                sVC.HPProgress.tintColor = ice
                sVC.attackProgress.tintColor = ice
                sVC.defenseProgress.tintColor = ice
                sVC.specialAttackProgress.tintColor = ice
                sVC.specialDefenseProgress.tintColor = ice
                sVC.speedProgress.tintColor = ice
                segmentedControl.tintColor = ice
            } else if colorOfType == "fighting" {
                let fighting = UIColor(hex: "#c45246ff")
                backgroundView.backgroundColor = fighting
                sVC.HPProgress.tintColor = fighting
                sVC.attackProgress.tintColor = fighting
                sVC.defenseProgress.tintColor = fighting
                sVC.specialAttackProgress.tintColor = fighting
                sVC.specialDefenseProgress.tintColor = fighting
                sVC.speedProgress.tintColor = fighting
                segmentedControl.tintColor = fighting
            } else if colorOfType == "poison" {
                let poison = UIColor(hex: "#a040a0ff")
                backgroundView.backgroundColor = poison
                sVC.HPProgress.tintColor = poison
                sVC.attackProgress.tintColor = poison
                sVC.defenseProgress.tintColor = poison
                sVC.specialAttackProgress.tintColor = poison
                sVC.specialDefenseProgress.tintColor = poison
                sVC.speedProgress.tintColor = poison
                segmentedControl.tintColor = poison
            } else if colorOfType == "ground" {
                let ground = UIColor(hex: "#e0c068ff")
                backgroundView.backgroundColor = ground
                sVC.HPProgress.tintColor = ground
                sVC.attackProgress.tintColor = ground
                sVC.defenseProgress.tintColor = ground
                sVC.specialAttackProgress.tintColor = ground
                sVC.specialDefenseProgress.tintColor = ground
                sVC.speedProgress.tintColor = ground
                segmentedControl.tintColor = ground
            } else if colorOfType == "flying" {
                let flying = UIColor(hex: "#baa9efff")
                backgroundView.backgroundColor = flying
                sVC.HPProgress.tintColor = flying
                sVC.attackProgress.tintColor = flying
                sVC.defenseProgress.tintColor = flying
                sVC.specialAttackProgress.tintColor = flying
                sVC.specialDefenseProgress.tintColor = flying
                sVC.speedProgress.tintColor = flying
                segmentedControl.tintColor = flying
            } else if colorOfType == "psychic" {
                let psychic = UIColor(hex: "#ff7690ff")
                backgroundView.backgroundColor = psychic
                sVC.HPProgress.tintColor = psychic
                sVC.attackProgress.tintColor = psychic
                sVC.defenseProgress.tintColor = psychic
                sVC.specialAttackProgress.tintColor = psychic
                sVC.specialDefenseProgress.tintColor = psychic
                sVC.speedProgress.tintColor = psychic
                segmentedControl.tintColor = psychic
            } else if colorOfType == "bug" {
                let bug = UIColor(hex: "#a8b820ff")
                backgroundView.backgroundColor = bug
                sVC.HPProgress.tintColor = bug
                sVC.attackProgress.tintColor = bug
                sVC.defenseProgress.tintColor = bug
                sVC.specialAttackProgress.tintColor = bug
                sVC.specialDefenseProgress.tintColor = bug
                sVC.speedProgress.tintColor = bug
                segmentedControl.tintColor = bug
            } else if colorOfType == "rock" {
                let rock = UIColor(hex: "#b8a038ff")
                backgroundView.backgroundColor = rock
                sVC.HPProgress.tintColor = rock
                sVC.attackProgress.tintColor = rock
                sVC.defenseProgress.tintColor = rock
                sVC.specialAttackProgress.tintColor = rock
                sVC.specialDefenseProgress.tintColor = rock
                sVC.speedProgress.tintColor = rock
                segmentedControl.tintColor = rock
            } else if colorOfType == "ghost" {
                let ghost = UIColor(hex: "#705898ff")
                backgroundView.backgroundColor = ghost
                sVC.HPProgress.tintColor = ghost
                sVC.attackProgress.tintColor = ghost
                sVC.defenseProgress.tintColor = ghost
                sVC.specialAttackProgress.tintColor = ghost
                sVC.specialDefenseProgress.tintColor = ghost
                sVC.speedProgress.tintColor = ghost
                segmentedControl.tintColor = ghost
            } else if colorOfType == "dark" {
                let dark = UIColor(hex: "#30336bff")
                backgroundView.backgroundColor = dark
                sVC.HPProgress.tintColor = dark
                sVC.attackProgress.tintColor = dark
                sVC.defenseProgress.tintColor = dark
                sVC.specialAttackProgress.tintColor = dark
                sVC.specialDefenseProgress.tintColor = dark
                sVC.speedProgress.tintColor = dark
                segmentedControl.tintColor = dark
            } else if colorOfType == "dragon" {
                let dragon = UIColor(hex: "#7c46ffff")
                backgroundView.backgroundColor = dragon
                sVC.HPProgress.tintColor = dragon
                sVC.attackProgress.tintColor = dragon
                sVC.defenseProgress.tintColor = dragon
                sVC.specialAttackProgress.tintColor = dragon
                sVC.specialDefenseProgress.tintColor = dragon
                sVC.speedProgress.tintColor = dragon
                segmentedControl.tintColor = dragon
            } else if colorOfType == "steel" {
                let steel = UIColor(hex: "#a6a6d3ff")
                backgroundView.backgroundColor = steel
                sVC.HPProgress.tintColor = steel
                sVC.attackProgress.tintColor = steel
                sVC.defenseProgress.tintColor = steel
                sVC.specialAttackProgress.tintColor = steel
                sVC.specialDefenseProgress.tintColor = steel
                sVC.speedProgress.tintColor = steel
                segmentedControl.tintColor = steel
            } else if colorOfType == "fairy" {
                let fairy = UIColor(hex: "#ee99acff")
                backgroundView.backgroundColor = fairy
                sVC.HPProgress.tintColor = fairy
                sVC.attackProgress.tintColor = fairy
                sVC.defenseProgress.tintColor = fairy
                sVC.specialAttackProgress.tintColor = fairy
                sVC.specialDefenseProgress.tintColor = fairy
                sVC.speedProgress.tintColor = fairy
                segmentedControl.tintColor = fairy
            }
        }
    }
    
    // Segmented Control Setup
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            descriptionView.isHidden = false
            statsView.isHidden = true
        } else {
            descriptionView.isHidden = true
            statsView.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let descriptionVC = segue.destination as? DescriptionViewController {
            self.desVC = descriptionVC
        }
        if let statVC = segue.destination as? StatsViewController {
            self.statsVC = statVC
        }

    }

}
