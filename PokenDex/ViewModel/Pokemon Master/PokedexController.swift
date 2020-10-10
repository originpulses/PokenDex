//
//  PokedexController.swift
//  PokenDex
//
//  Created by Sabih on 20/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import CoreData

// MARK: - Collection View Setup

private let reuseIdentifier = "PokeCell"

class PokedexController: UICollectionViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    var searchActive : Bool = false
    var isFinalToLoad : Bool = false
    var pokemonArrayFiltered = [Results?]()
    var favourites = [Favourites]()
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=809"
    
    let service = PokendexService()
    
    var pokemonsViewModel = PokemonsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButtonPressed(searchButton)
        longPressOnCell()
        getPokemons(url: url)
    }
    
    func getPokemons(url: String) {
        pokemonsViewModel.getPokemons(url: url) { results in
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return pokemonArrayFiltered.count
        } else {
            if pokemonsViewModel.pokemons != nil {
                return (pokemonsViewModel.pokemons?.results!.count)!
            } else { return 0 }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if searchActive {
            let viewImage = cell.viewWithTag(1000) as? UIImageView
            let viewLabel = cell.viewWithTag(1001) as? UILabel
            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
            let viewColour = cell.viewWithTag(1003)
            
            viewLabel?.text = pokemonArrayFiltered[indexPath.item]?.name?.capitalizingFirstLetter()
            let url = (pokemonArrayFiltered[indexPath.item]?.url)!
            let id = String(format: "%03d", Int(url.split(separator: "/").last!)!)
            let imageUrl = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(id).png")!
            viewImage?.kf.setImage(with: imageUrl)
            viewLabelTwo?.text = "#\(id)"
            
            var pokemonDetailViewModel: PokemonDetailViewModel! {
                didSet {
                    let colorOfType = pokemonDetailViewModel.pokemonDetail.types?.first
                    if let colorOfType = colorOfType?.type?.name {
                        if colorOfType == "normal" {
                            let normal = UIColor(hex: "#a8a878ff")
                            viewColour?.backgroundColor = normal
                        } else if colorOfType == "fire" {
                            let fire = UIColor(hex: "#fd9644ff")
                            viewColour?.backgroundColor = fire
                        } else if colorOfType == "water" {
                            let water = UIColor(hex: "#54a0ffff")
                            viewColour?.backgroundColor = water
                        } else if colorOfType == "grass" {
                            let grass = UIColor(hex: "#20bf6bff")
                            viewColour?.backgroundColor = grass
                        } else if colorOfType == "electric" {
                            let electric = UIColor(hex: "#f3ca3eff")
                            viewColour?.backgroundColor = electric
                        } else if colorOfType == "ice" {
                            let ice = UIColor(hex: "#98d8d8ff")
                            viewColour?.backgroundColor = ice
                        } else if colorOfType == "fighting" {
                            let fighting = UIColor(hex: "#c45246ff")
                            viewColour?.backgroundColor = fighting
                        } else if colorOfType == "poison" {
                            let poison = UIColor(hex: "#a040a0ff")
                            viewColour?.backgroundColor = poison
                        } else if colorOfType == "ground" {
                            let ground = UIColor(hex: "#e0c068ff")
                            viewColour?.backgroundColor = ground
                        } else if colorOfType == "flying" {
                            let flying = UIColor(hex: "#baa9efff")
                            viewColour?.backgroundColor = flying
                        } else if colorOfType == "psychic" {
                            let psychic = UIColor(hex: "#ff7690ff")
                            viewColour?.backgroundColor = psychic
                        } else if colorOfType == "bug" {
                            let bug = UIColor(hex: "#a8b820ff")
                            viewColour?.backgroundColor = bug
                        } else if colorOfType == "rock" {
                            let rock = UIColor(hex: "#b8a038ff")
                            viewColour?.backgroundColor = rock
                        } else if colorOfType == "ghost" {
                            let ghost = UIColor(hex: "#705898ff")
                            viewColour?.backgroundColor = ghost
                        } else if colorOfType == "dark" {
                            let dark = UIColor(hex: "#30336bff")
                            viewColour?.backgroundColor = dark
                        } else if colorOfType == "dragon" {
                            let dragon = UIColor(hex: "#7c46ffff")
                            viewColour?.backgroundColor = dragon
                        } else if colorOfType == "steel" {
                            let steel = UIColor(hex: "#a6a6d3ff")
                            viewColour?.backgroundColor = steel
                        } else if colorOfType == "fairy" {
                            let fairy = UIColor(hex: "#ee99acff")
                            viewColour?.backgroundColor = fairy
                        }
                    }
                }
            }
            
            service.get(url: url) { result in
                switch result {
                case .success(let data):
                    if data != nil {
                        pokemonDetailViewModel = PokemonDetailViewModel(pokemonDetail: (data?.toModel())!)
                    } else {
                        self.showAlert(title: "Error", message: "Not return any pokemon")
                    }
                case .failure(let error):
                    self.showAlert(title: "Error", message: "Error - \n\(error)")
                    print(error.localizedDescription)
                }
            }
            
        } else {
            
            let viewImage = cell.viewWithTag(1000) as? UIImageView
            let viewLabel = cell.viewWithTag(1001) as? UILabel
            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
            let viewColour = cell.viewWithTag(1003)
            
            if let name = pokemonsViewModel.pokemons?.results?[indexPath.item].name {
                viewLabel?.text = name.capitalizingFirstLetter()
            }
            if let url = pokemonsViewModel.pokemons?.results?[indexPath.item].url {
                let id = String(format: "%03d", Int(url.split(separator: "/").last!)!)
                let imageUrl = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(id).png")!
                viewImage?.kf.setImage(with: imageUrl)
                viewLabelTwo?.text = "#\(id)"
                
                var pokemonDetailViewModel: PokemonDetailViewModel! {
                    didSet {
                        let colorOfType = pokemonDetailViewModel.pokemonDetail.types?.first
                        if let colorOfType = colorOfType?.type?.name {
                            if colorOfType == "normal" {
                                let normal = UIColor(hex: "#a8a878ff")
                                viewColour?.backgroundColor = normal
                            } else if colorOfType == "fire" {
                                let fire = UIColor(hex: "#fd9644ff")
                                viewColour?.backgroundColor = fire
                            } else if colorOfType == "water" {
                                let water = UIColor(hex: "#54a0ffff")
                                viewColour?.backgroundColor = water
                            } else if colorOfType == "grass" {
                                let grass = UIColor(hex: "#20bf6bff")
                                viewColour?.backgroundColor = grass
                            } else if colorOfType == "electric" {
                                let electric = UIColor(hex: "#f3ca3eff")
                                viewColour?.backgroundColor = electric
                            } else if colorOfType == "ice" {
                                let ice = UIColor(hex: "#98d8d8ff")
                                viewColour?.backgroundColor = ice
                            } else if colorOfType == "fighting" {
                                let fighting = UIColor(hex: "#c45246ff")
                                viewColour?.backgroundColor = fighting
                            } else if colorOfType == "poison" {
                                let poison = UIColor(hex: "#a040a0ff")
                                viewColour?.backgroundColor = poison
                            } else if colorOfType == "ground" {
                                let ground = UIColor(hex: "#e0c068ff")
                                viewColour?.backgroundColor = ground
                            } else if colorOfType == "flying" {
                                let flying = UIColor(hex: "#baa9efff")
                                viewColour?.backgroundColor = flying
                            } else if colorOfType == "psychic" {
                                let psychic = UIColor(hex: "#ff7690ff")
                                viewColour?.backgroundColor = psychic
                            } else if colorOfType == "bug" {
                                let bug = UIColor(hex: "#a8b820ff")
                                viewColour?.backgroundColor = bug
                            } else if colorOfType == "rock" {
                                let rock = UIColor(hex: "#b8a038ff")
                                viewColour?.backgroundColor = rock
                            } else if colorOfType == "ghost" {
                                let ghost = UIColor(hex: "#705898ff")
                                viewColour?.backgroundColor = ghost
                            } else if colorOfType == "dark" {
                                let dark = UIColor(hex: "#30336bff")
                                viewColour?.backgroundColor = dark
                            } else if colorOfType == "dragon" {
                                let dragon = UIColor(hex: "#7c46ffff")
                                viewColour?.backgroundColor = dragon
                            } else if colorOfType == "steel" {
                                let steel = UIColor(hex: "#a6a6d3ff")
                                viewColour?.backgroundColor = steel
                            } else if colorOfType == "fairy" {
                                let fairy = UIColor(hex: "#ee99acff")
                                viewColour?.backgroundColor = fairy
                            }
                        }
                    }
                }
                
                service.get(url: url) { result in
                    switch result {
                    case .success(let data):
                        if data != nil {
                            pokemonDetailViewModel = PokemonDetailViewModel(pokemonDetail: (data?.toModel())!)
                        } else {
                            self.showAlert(title: "Error", message: "Not return any pokemon")
                        }
                    case .failure(let error):
                        self.showAlert(title: "Error", message: "Error - \n\(error)")
                        print(error.localizedDescription)
                    }
                }
                
            }
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokemonViewController {
            if searchActive {
                let url = pokemonArrayFiltered[indexPath.item]?.url
                let id = Int(url!.split(separator: "/").last!)!
                destination.id = id
            } else {
                let url = pokemonsViewModel.pokemons?.results?[indexPath.item].url
                let id = Int(url!.split(separator: "/").last!)!
                destination.id = id
            }
        }
    }
    
    
    // MARK: - Search Functionality
    @objc func showSearchBar() {
        configureSearchBar()
    }
    
    func configureSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
    }
    
    
    // MARK: - Long Press Gesture Setup
    private func longPressOnCell() {
        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        longPressedGesture.minimumPressDuration = 0.5
        longPressedGesture.delegate = self as? UIGestureRecognizerDelegate
        longPressedGesture.delaysTouchesBegan = true
        collectionView?.addGestureRecognizer(longPressedGesture)
    }
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if (gestureRecognizer.state != .began) {
            return
        }
        
        let p = gestureRecognizer.location(in: collectionView)
        
        if searchActive {
            if let indexPath = collectionView?.indexPathForItem(at: p) {
                let blurEffect = UIBlurEffect(style: .light)
                let visualEffectView = UIVisualEffectView(effect: blurEffect)
                visualEffectView.frame = view.frame
                let alert = UIAlertController(title: "Add \(pokemonArrayFiltered[indexPath.item]?.name?.capitalizingFirstLetter() ?? "Pokemon") to Favourites?", message: "", preferredStyle: .alert)
                alert.view.accessibilityIdentifier = "AddingAlert"
                let action = UIAlertAction(title: "Add Pokemon", style: .default) { (action) in
                    
                    do {
                        self.loadPokemon()
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        let request : NSFetchRequest<Favourites> = Favourites.fetchRequest()
                        if let url = self.pokemonArrayFiltered[indexPath.item]?.url {
                            let id = Int(url.split(separator: "/").last!)!
                            request.predicate = NSPredicate(format: "id == %d", id)
                        }
                        let numberOfID = try context.count(for: request)
                        if numberOfID == 0 {
                            let newFav = Favourites(context: context)
                            if let name = self.pokemonArrayFiltered[indexPath.item]?.name {
                                newFav.name = name.capitalizingFirstLetter()
                            }
                            if let url = self.pokemonArrayFiltered[indexPath.item]?.url {
                                newFav.pokedexID = String(format: "%03d", Int(url.split(separator: "/").last!)!)
                                let id = Int(url.split(separator: "/").last!)!
                                newFav.id = Int64(id)
                                let imageCode = String(format: "%03d", Int(url.split(separator: "/").last!)!)
                                newFav.image = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(imageCode).png"
                                newFav.isFav = false
                            }
                            try context.save()
                        } else {
                            self.showAlert(title: "Already Exists", message: "You have already favourited this Pokemon")
                        }
                    } catch {
                        print("Error saving context \(error)")
                    }
                    
                    visualEffectView.removeFromSuperview()
                }
                
                let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                    visualEffectView.removeFromSuperview()
                }
                view.addSubview(visualEffectView)
                alert.addAction(action)
                alert.addAction(cancel)
                present(alert, animated: true, completion: nil)
            }
        } else {
            if let indexPath = collectionView?.indexPathForItem(at: p) {
                let blurEffect = UIBlurEffect(style: .light)
                let visualEffectView = UIVisualEffectView(effect: blurEffect)
                visualEffectView.frame = view.frame
                let alert = UIAlertController(title: "Add \(pokemonsViewModel.pokemons?.results?[indexPath.item].name!.capitalizingFirstLetter() ?? "Pokemon") to Favourites?", message: "", preferredStyle: .alert)
                alert.view.accessibilityIdentifier = "AddingAlert"
                let action = UIAlertAction(title: "Add Pokemon", style: .default) { (action) in
                    
                    do {
                        self.loadPokemon()
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        let request : NSFetchRequest<Favourites> = Favourites.fetchRequest()
                        if let url = self.pokemonsViewModel.pokemons?.results?[indexPath.item].url {
                            let id = Int(url.split(separator: "/").last!)!
                            request.predicate = NSPredicate(format: "id == %d", id)
                        }
                        let numberOfID = try context.count(for: request)
                        if numberOfID == 0 {
                            let newFav = Favourites(context: context)
                            if let name = self.pokemonsViewModel.pokemons?.results?[indexPath.item].name {
                                newFav.name = name.capitalizingFirstLetter()
                            }
                            if let url = self.pokemonsViewModel.pokemons?.results?[indexPath.item].url {
                                newFav.pokedexID = String(format: "%03d", Int(url.split(separator: "/").last!)!)
                                let id = Int(url.split(separator: "/").last!)!
                                newFav.id = Int64(id)
                                let imageCode = String(format: "%03d", Int(url.split(separator: "/").last!)!)
                                newFav.image = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(imageCode).png"
                                newFav.isFav = false
                            }
                            try context.save()
                        } else {
                            self.showAlert(title: "Already Exists", message: "You have already favourited this Pokemon")
                        }
                    } catch {
                        print("Error saving context \(error)")
                    }
                    
                    visualEffectView.removeFromSuperview()
                }
                
                let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                    visualEffectView.removeFromSuperview()
                }
                view.addSubview(visualEffectView)
                alert.addAction(action)
                alert.addAction(cancel)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func loadPokemon() {
        let request: NSFetchRequest<Favourites> = Favourites.fetchRequest()
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            favourites = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
}


// MARK: - SearchBar Delegate Methods
extension PokedexController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        pokemonArrayFiltered.removeAll()
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        searchActive = false
        collectionView?.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pokemonArrayFiltered.removeAll()
        if (searchBar.text!.isEmpty) {
            searchActive = false
            collectionView?.reloadData()
            view.endEditing(true)
        } else {
            searchActive = true
            if let poke = pokemonsViewModel.pokemons?.results {
                for item in poke {
                    let name = item.name!.lowercased()
                    if ((name.contains(searchBar.text!.lowercased()))) {
                        pokemonArrayFiltered.append(item)
                    }
                }
            }
            collectionView?.reloadData()
        }
    }
    
}

// MARK: - Collection View 2 Cells Per Row Setup
extension PokedexController: UICollectionViewDelegateFlowLayout {
    
    // Sets up 2 cells per row no matter what the screen size. It calculates the bounds width and sets up the right and left inset accordingly
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = (collectionView.bounds.width - 130*2 - 20)/2
        return UIEdgeInsets(top: 32, left: leftRightInset, bottom: 20, right: leftRightInset)
    }
    
    // This was done to fix a bug with the collection layout
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}
