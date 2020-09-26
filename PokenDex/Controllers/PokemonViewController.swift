////
////  PokemonViewController.swift
////  PokenDex
////
////  Created by Sabih on 21/8/20.
////  Copyright © 2020 RMIT. All rights reserved.
////
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
    var pokemonArray: [Int: String] = [:]
    var pokemonMainColor: UIColor?
    var speciesEvolutionArray: [SpecieDetailViewModel] = []
    
    let service = PokendexService()
    
    var pokemonDetailViewModel: PokemonDetailViewModel! {
        didSet {
            setPokemonImage()
            setPokemonData()
            setPokemonStatus()
            setPokemonTypes()
            if let specieUrl = pokemonDetailViewModel.pokemonDetail.species?.url {
                getSpecie(url: specieUrl)
            }
        }
    }
    
    var specieDetailViewModel: SpecieDetailViewModel! {
        didSet {
            if let dVC = desVC {
                dVC.pokemonDescription.text = specieDetailViewModel.getDataDescription()
                print(specieDetailViewModel.getDataDescription())
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius()
        
        getPokemon(url: "https://pokeapi.co/api/v2/pokemon/\(id)")
    }
    
//  Setting upper corner radius of the "white coloured detailed view"
    func setCornerRadius() {
        detailView.layer.cornerRadius = self.view.bounds.height*4/100
        detailView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
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
    
    private func setPokemonImage() {
        if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format: "%03d", id)).png") {
            pokemonImage.kf.setImage(with: url)
        }
    }
    
    private func setPokemonData() {
        if let name = pokemonDetailViewModel.pokemonDetail.name {
            pokemonName.text = name
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
                if let base_stat = stat.base_stat, let sVC = statsVC {
                    sVC.pokemonHP.text = "\(base_stat)"
                    sVC.HPProgress.setProgress(((sVC.pokemonHP.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("defense"))! {
                if let base_stat = stat.base_stat, let sVC = statsVC {
                    sVC.pokemonDefense.text = "\(base_stat)"
                    sVC.defenseProgress.setProgress(((sVC.pokemonDefense.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("attack"))! {
                if let base_stat = stat.base_stat, let sVC = statsVC {
                    sVC.pokemonAttack.text = "\(base_stat)"
                    sVC.attackProgress.setProgress(((sVC.pokemonAttack.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("special-attack"))! {
                if let base_stat = stat.base_stat, let sVC = statsVC {
                    sVC.pokemonSpecialAttack.text = "\(base_stat)"
                    sVC.specialAttackProgress.setProgress(((sVC.pokemonSpecialAttack.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("special-defense"))! {
                if let base_stat = stat.base_stat, let sVC = statsVC {
                    sVC.pokemonSpecialDefense.text = "\(base_stat)"
                    sVC.specialDefenseProgress.setProgress(((sVC.pokemonSpecialDefense.text?.floatValue())!/300), animated: false)
                }
            } else if (name?.elementsEqual("speed"))! {
                if let base_stat = stat.base_stat, let sVC = statsVC {
                    sVC.pokemonSpeed.text = "\(base_stat)"
                    sVC.speedProgress.setProgress(((sVC.pokemonSpeed.text?.floatValue())!/300), animated: false)
                }
            } else {
                showAlert(title: "Error", message: "Unknown Error")
            }
        }
    }
    
    private func setPokemonTypes() {
        let types = pokemonDetailViewModel.pokemonDetail.types
        for type in types! {
            let type = type.type?.name
            pokemonType.text = type
            backgroundView.backgroundColor = UIColor(named: type!)
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
}

//class PokemonViewController: UIViewController {
//
//    var selectedPokemon: (name: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, colour: UIColor?)?
//    
//    var desVC: DescriptionViewController?
//    var statsVC: StatsViewController?
//    
//    @IBOutlet weak var pokemonName: UILabel!
//    @IBOutlet weak var pokemonID: UILabel!
//    @IBOutlet weak var pokemonType: UILabel!
//    @IBOutlet weak var pokemonImage: UIImageView!
//    @IBOutlet weak var descriptionView: UIView!
//    @IBOutlet weak var statsView: UIView!
//    @IBOutlet weak var backgroundView: UIView!
//    @IBOutlet weak var detailView: UIView!
//    @IBOutlet weak var segmentedControl: UISegmentedControl!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setCornerRadius()
//        
//        // Setup detail view and passing data to 2 container views
//        if let selectedPokemon = selectedPokemon,
//            let dVC = desVC,
//            let sVC = statsVC {
//            pokemonName.text = selectedPokemon.name
//            pokemonImage.image = selectedPokemon.image
//            pokemonType.text = selectedPokemon.type
//            pokemonID.text = selectedPokemon.id
//            dVC.pokemonDescription.text = selectedPokemon.description
//            sVC.pokemonHP.text = selectedPokemon.HP
//            sVC.pokemonAttack.text = selectedPokemon.attack
//            sVC.pokemonDefense.text = selectedPokemon.defense
//            sVC.pokemonSpecialAttack.text = selectedPokemon.specialAttack
//            sVC.pokemonSpecialDefense.text = selectedPokemon.specialDefense
//            sVC.pokemonSpeed.text = selectedPokemon.speed
//            sVC.HPProgress.setProgress((Float(selectedPokemon.HP)!/300), animated: false)
//            sVC.HPProgress.tintColor = selectedPokemon.colour
//            sVC.attackProgress.setProgress((Float(selectedPokemon.attack)!/300), animated: false)
//            sVC.attackProgress.tintColor = selectedPokemon.colour
//            sVC.defenseProgress.setProgress((Float(selectedPokemon.defense)!/300), animated: false)
//            sVC.defenseProgress.tintColor = selectedPokemon.colour
//            sVC.specialAttackProgress.setProgress((Float(selectedPokemon.specialAttack)!/300), animated: false)
//            sVC.specialAttackProgress.tintColor = selectedPokemon.colour
//            sVC.specialDefenseProgress.setProgress((Float(selectedPokemon.specialDefense)!/300), animated: false)
//            sVC.specialDefenseProgress.tintColor = selectedPokemon.colour
//            sVC.speedProgress.setProgress((Float(selectedPokemon.speed)!/300), animated: false)
//            sVC.speedProgress.tintColor = selectedPokemon.colour
//            backgroundView.backgroundColor = selectedPokemon.colour
//            segmentedControl.tintColor = selectedPokemon.colour
//        }
//    }
//    
//     Setting upper corner radius of the "white coloured detailed view"
//    func setCornerRadius() {
//        self.detailView.layer.cornerRadius = self.view.bounds.height*4/100
//        self.detailView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//    }
//
//    // To pass data to the container views by referencing them through segues
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? DescriptionViewController {
//            desVC = vc
//        }
//        if let vc = segue.destination as? StatsViewController {
//            statsVC = vc
//        }
//    }
//    
//    // Segmented Control Setup
//    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            descriptionView.isHidden = false
//            statsView.isHidden = true
//        } else {
//            descriptionView.isHidden = true
//            statsView.isHidden = false
//        }
//    }
//}
