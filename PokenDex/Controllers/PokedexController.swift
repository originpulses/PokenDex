////
////  PokedexController.swift
////  PokenDex
////
////  Created by Sabih on 20/8/20.
////  Copyright © 2020 RMIT. All rights reserved.
////
//
//import UIKit
//
//// MARK: - Collection View Setup
//
//private let reuseIdentifier = "PokeCell"
//
//class PokedexController: UICollectionViewController {
//    
//    @IBOutlet var searchBar: UISearchBar!
//    @IBOutlet weak var searchButton: UIBarButtonItem!
//    
//    private let viewModel = PokemonViewModel()
//    private var filteredPokemon: [Pokemon] = [] // Filtered Array that holds the searched Pokemons
//    var inSearchMode = false
//    
//    // Returns data of filtered Pokemon
//    func getFilteredPokemon(byIndex index: Int) -> (name: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, colour: UIColor?) {
//        
//        let name = filteredPokemon[index].name
//        let description = filteredPokemon[index].description
//        let image = filteredPokemon[index].imageName
//        let id = filteredPokemon[index].pokedexID
//        let type = filteredPokemon[index].type
//        let HP = filteredPokemon[index].HP
//        let attack = filteredPokemon[index].attack
//        let defense = filteredPokemon[index].defense
//        let specialAttack = filteredPokemon[index].specialAttack
//        let specialDefense = filteredPokemon[index].specialDefense
//        let speed = filteredPokemon[index].specialDefense
//        let colour = filteredPokemon[index].colour
//        
//        return (name, description, image, id, type, HP, attack, defense, specialAttack, specialDefense, speed, colour)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        searchButtonPressed(searchButton)
//        longPressOnCell()
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return inSearchMode ? filteredPokemon.count : viewModel.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        
//        if inSearchMode {
//            let viewImage = cell.viewWithTag(1000) as? UIImageView
//            let viewLabel = cell.viewWithTag(1001) as? UILabel
//            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
//            let viewColour = cell.viewWithTag(1003)
//
//            if let viewImage = viewImage, let viewLabel = viewLabel, let viewLabelTwo = viewLabelTwo {
//                let currentPokemon = filteredPokemon[indexPath.item]
//                viewImage.image = currentPokemon.imageName
//                viewLabel.text = currentPokemon.name
//                viewLabelTwo.text = currentPokemon.pokedexID
//                viewColour?.backgroundColor = currentPokemon.colour
//            }
//        } else {
//            let imageView = cell.viewWithTag(1000) as? UIImageView
//            let pokemonTitle = cell.viewWithTag(1001) as? UILabel
//            let pokemonID = cell.viewWithTag(1002) as? UILabel
//            let colourView = cell.viewWithTag(1003)
//            
//            if let imageView = imageView, let pokemonTitle = pokemonTitle, let pokemonID = pokemonID {
//                let currentPokemon = viewModel.getPokemon(byIndex: indexPath.item)
//                imageView.image = currentPokemon.image
//                pokemonTitle.text = currentPokemon.name
//                pokemonID.text = currentPokemon.id
//                colourView?.backgroundColor = currentPokemon.colour
//            }
//        }
//        return cell
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let cell = sender as? UICollectionViewCell,
//            let indexPath = self.collectionView?.indexPath(for: cell) else {return}
//        if let destination = segue.destination as? PokemonViewController {
//            if inSearchMode {
//                let selectedPokemon = getFilteredPokemon(byIndex: indexPath.row)
//                destination.selectedPokemon = selectedPokemon
//            } else {
//                let selectedPokemon = viewModel.getPokemon(byIndex: indexPath.row)
//                destination.selectedPokemon = selectedPokemon
//            }
//        }
//    }
//    
//    
//    // MARK: - Search Functionality
//    @objc func showSearchBar() {
//        configureSearchBar()
//    }
//    
//    func configureSearchBar() {
//        searchBar = UISearchBar()
//        searchBar.delegate = self
//        searchBar.sizeToFit()
//        searchBar.showsCancelButton = true
//        searchBar.becomeFirstResponder()
//        navigationItem.rightBarButtonItem = nil
//        navigationItem.titleView = searchBar
//    }
//    
//    @IBAction func searchButtonPressed(_ sender: Any) {
//        navigationItem.titleView = nil
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
//    }
//    
//    
//    // MARK: - Long Press Gesture Setup
//    private func longPressOnCell() {
//        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
//        longPressedGesture.minimumPressDuration = 0.5
//        longPressedGesture.delegate = self as? UIGestureRecognizerDelegate
//        longPressedGesture.delaysTouchesBegan = true
//        collectionView?.addGestureRecognizer(longPressedGesture)
//    }
//    
//    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
//        if (gestureRecognizer.state != .began) {
//            return
//        }
//        
//        let p = gestureRecognizer.location(in: collectionView)
//        
//        if let indexPath = collectionView?.indexPathForItem(at: p) {
//            
//            let blurEffect = UIBlurEffect(style: .light)
//            let visualEffectView = UIVisualEffectView(effect: blurEffect)
//            visualEffectView.frame = view.frame
//            let alert = UIAlertController(title: "Add \(viewModel.getPokemon(byIndex: indexPath.item).name) to Favourites?", message: "", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Add Pokemon", style: .default) { (action) in
//                
//                let name = self.viewModel.getPokemon(byIndex: indexPath.item).name
//                let description = self.viewModel.getPokemon(byIndex: indexPath.item).description
//                let image = self.viewModel.getPokemon(byIndex: indexPath.item).image
//                let id = self.viewModel.getPokemon(byIndex: indexPath.item).id
//                let type = self.viewModel.getPokemon(byIndex: indexPath.item).type
//                let hp = self.viewModel.getPokemon(byIndex: indexPath.item).HP
//                let attack = self.viewModel.getPokemon(byIndex: indexPath.item).attack
//                let defense = self.viewModel.getPokemon(byIndex: indexPath.item).defense
//                let sa = self.viewModel.getPokemon(byIndex: indexPath.item).specialAttack
//                let sd = self.viewModel.getPokemon(byIndex: indexPath.item).specialDefense
//                let speed = self.viewModel.getPokemon(byIndex: indexPath.item).speed
//                let colour = self.viewModel.getPokemon(byIndex: indexPath.item).colour
//                
//                favourites.append(Pokemon.init(name: name, description: description, imageName: image, pokedexID: id, type: type, HP: hp, attack: attack, defense: defense, specialAttack: sa, specialDefense: sd, speed: speed, colour: colour))
//                print(favourites)
//                
//                visualEffectView.removeFromSuperview()
//            }
//            
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
//                print("Success!")
//                visualEffectView.removeFromSuperview()
//            }
//            view.addSubview(visualEffectView)
//            alert.addAction(action)
//            alert.addAction(cancel)
//            present(alert, animated: true, completion: nil)
//        }
//    }
//}
//
//
//// MARK: - SearchBar Delegate Methods
//extension PokedexController: UISearchBarDelegate {
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        navigationItem.titleView = nil
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
//        inSearchMode = false
//        collectionView?.reloadData()
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" || searchBar.text == nil {
//            inSearchMode = false
//            collectionView?.reloadData()
//            view.endEditing(true)
//        } else {
//            inSearchMode = true
//            filteredPokemon = viewModel.pokemons.filter({ $0.name.range(of: searchText) != nil })
//            collectionView?.reloadData()
//        }
//    }
//}
//
//// MARK: - Collection View 2 Cells Per Row Setup
//extension PokedexController: UICollectionViewDelegateFlowLayout {
//    
//    // Sets up 2 cells per row no matter what the screen size. It calculates the bounds width and sets up the right and left inset accordingly
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let leftRightInset = (collectionView.bounds.width - 130*2 - 20)/2
//        return UIEdgeInsets(top: 32, left: leftRightInset, bottom: 20, right: leftRightInset)
//    }
//    
//    // This was done to fix a bug with the collection layout
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        collectionView?.collectionViewLayout.invalidateLayout();
//    }
//}

import Foundation
import UIKit
import Kingfisher

// MARK: - Collection View Setup

private let reuseIdentifier = "PokeCell"

class PokedexController: UICollectionViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    var searchActive : Bool = false
    var isFinalToLoad : Bool = false
    var pokemonArrayFiltered = [Results?]()
    
    let url = "https://pokeapi.co/api/v2/pokemon"
    
    let service = PokendexService()
    
    var pokemonsViewModel = PokemonsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButtonPressed(searchButton)
//        longPressOnCell()
        getPokemons(url: url)
    }
    
    func getPokemons(url: String) {
        pokemonsViewModel.getPokemons(url: url) { results in
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return inSearchMode ? filteredPokemon.count : viewModel.count
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(searchActive) {
            return pokemonArrayFiltered.count
        } else {
            if pokemonsViewModel.pokemons != nil {
                return (pokemonsViewModel.pokemons?.results!.count)!
            } else { return 0 }
        }
    }

//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        if inSearchMode {
//            let viewImage = cell.viewWithTag(1000) as? UIImageView
//            let viewLabel = cell.viewWithTag(1001) as? UILabel
//            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
//            let viewColour = cell.viewWithTag(1003)
//
//            if let viewImage = viewImage, let viewLabel = viewLabel, let viewLabelTwo = viewLabelTwo {
//                let currentPokemon = filteredPokemon[indexPath.item]
//                viewImage.image = currentPokemon.imageName
//                viewLabel.text = currentPokemon.name
//                viewLabelTwo.text = currentPokemon.pokedexID
//                viewColour?.backgroundColor = currentPokemon.colour
//            }
//        } else {
//            let imageView = cell.viewWithTag(1000) as? UIImageView
//            let pokemonTitle = cell.viewWithTag(1001) as? UILabel
//            let pokemonID = cell.viewWithTag(1002) as? UILabel
//            let colourView = cell.viewWithTag(1003)
//
//            if let imageView = imageView, let pokemonTitle = pokemonTitle, let pokemonID = pokemonID {
//                let currentPokemon = viewModel.getPokemon(byIndex: indexPath.item)
//                imageView.image = currentPokemon.image
//                pokemonTitle.text = currentPokemon.name
//                pokemonID.text = currentPokemon.id
//                colourView?.backgroundColor = currentPokemon.colour
//            }
//        }
//        return cell
//    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if searchActive {
            let viewImage = cell.viewWithTag(1000) as? UIImageView
            let viewLabel = cell.viewWithTag(1001) as? UILabel
//            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
//            let viewColour = cell.viewWithTag(1003)
            
            viewLabel?.text = pokemonArrayFiltered[indexPath.item]?.name
            let url = (pokemonArrayFiltered[indexPath.item]?.url)!
            let id = String(format: "%03d", Int(url.split(separator: "/").last!)!)
            let imageUrl = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(id).png")!
            viewImage?.kf.setImage(with: imageUrl)
        } else {
            
            let viewImage = cell.viewWithTag(1000) as? UIImageView
            let viewLabel = cell.viewWithTag(1001) as? UILabel
            //            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
            //            let viewColour = cell.viewWithTag(1003)
            
            if let name = pokemonsViewModel.pokemons?.results?[indexPath.item].name {
                viewLabel?.text = name
            }
            if let url = pokemonsViewModel.pokemons?.results?[indexPath.item].url {
                let id = String(format: "%03d", Int(url.split(separator: "/").last!)!)
                let imageUrl = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(id).png")!
                viewImage?.kf.setImage(with: imageUrl)
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !searchActive {
            if !isFinalToLoad {
                if indexPath.item == (pokemonsViewModel.pokemons?.results!.count)! - 4 &&
                    (pokemonsViewModel.pokemons?.results!.count)! < (pokemonsViewModel.pokemons?.count)! {
                    if (!((pokemonsViewModel.pokemons?.next!.elementsEqual("https://pokeapi.co/api/v2/pokemon?offset=780&limit=20"))!)) {
                        getPokemons(url: (pokemonsViewModel.pokemons?.next!)!)
                    } else {
                        
                        getPokemons(url: "https://pokeapi.co/api/v2/pokemon?offset=780&limit=27")
                        isFinalToLoad = true
                    }
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokemonViewController {
            if searchActive {
                let url = (self.pokemonArrayFiltered[indexPath.item]?.url)!
                let id = Int(url.split(separator: "/").last!)!
                destination.id = id
            } else {
                let url = self.pokemonsViewModel.pokemons?.results![indexPath.item].url
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


//    // MARK: - Long Press Gesture Setup
//    private func longPressOnCell() {
//        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
//        longPressedGesture.minimumPressDuration = 0.5
//        longPressedGesture.delegate = self as? UIGestureRecognizerDelegate
//        longPressedGesture.delaysTouchesBegan = true
//        collectionView?.addGestureRecognizer(longPressedGesture)
//    }
//
//    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
//        if (gestureRecognizer.state != .began) {
//            return
//        }
//
//        let p = gestureRecognizer.location(in: collectionView)
//
//        if let indexPath = collectionView?.indexPathForItem(at: p) {
//
//            let blurEffect = UIBlurEffect(style: .light)
//            let visualEffectView = UIVisualEffectView(effect: blurEffect)
//            visualEffectView.frame = view.frame
//            let alert = UIAlertController(title: "Add \(viewModel.getPokemon(byIndex: indexPath.item).name) to Favourites?", message: "", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Add Pokemon", style: .default) { (action) in
//
//                let name = self.viewModel.getPokemon(byIndex: indexPath.item).name
//                let description = self.viewModel.getPokemon(byIndex: indexPath.item).description
//                let image = self.viewModel.getPokemon(byIndex: indexPath.item).image
//                let id = self.viewModel.getPokemon(byIndex: indexPath.item).id
//                let type = self.viewModel.getPokemon(byIndex: indexPath.item).type
//                let hp = self.viewModel.getPokemon(byIndex: indexPath.item).HP
//                let attack = self.viewModel.getPokemon(byIndex: indexPath.item).attack
//                let defense = self.viewModel.getPokemon(byIndex: indexPath.item).defense
//                let sa = self.viewModel.getPokemon(byIndex: indexPath.item).specialAttack
//                let sd = self.viewModel.getPokemon(byIndex: indexPath.item).specialDefense
//                let speed = self.viewModel.getPokemon(byIndex: indexPath.item).speed
//                let colour = self.viewModel.getPokemon(byIndex: indexPath.item).colour
//
//                favourites.append(Pokemon.init(name: name, description: description, imageName: image, pokedexID: id, type: type, HP: hp, attack: attack, defense: defense, specialAttack: sa, specialDefense: sd, speed: speed, colour: colour))
//                print(favourites)
//
//                visualEffectView.removeFromSuperview()
//            }
//
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
//                print("Success!")
//                visualEffectView.removeFromSuperview()
//            }
//            view.addSubview(visualEffectView)
//            alert.addAction(action)
//            alert.addAction(cancel)
//            present(alert, animated: true, completion: nil)
//        }
//    }
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

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil {
            searchActive = false
            collectionView?.reloadData()
            view.endEditing(true)
        } else {
            self.searchActive = true
            self.isFinalToLoad = true
            if let poke = self.pokemonsViewModel.pokemons?.results {
                for item in poke {
                    let name = item.name!.lowercased()
                    if ((name.contains(searchBar.text!.lowercased()))) {
                        self.pokemonArrayFiltered.append(item)
                    }
                    print(name)
                    print(searchBar.text!.lowercased())
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
        collectionView?.collectionViewLayout.invalidateLayout();
    }
}
