//
//  PokedexController.swift
//  PokenDex
//
//  Created by Sabih on 20/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PokeCell"

class PokedexController: UICollectionViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    
    private let viewModel = PokemonViewModel()
    private var filteredPokemon: [Pokemon] = []
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButtonPressed(searchButton)
        longPressOnCell()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inSearchMode ? filteredPokemon.count : viewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if inSearchMode {
            let viewImage = cell.viewWithTag(1000) as? UIImageView
            let viewLabel = cell.viewWithTag(1001) as? UILabel
            let viewLabelTwo = cell.viewWithTag(1002) as? UILabel
            let viewColour = cell.viewWithTag(1003)

            if let viewImage = viewImage, let viewLabel = viewLabel, let viewLabelTwo = viewLabelTwo {
                let currentPokemon = filteredPokemon[indexPath.item]
                viewImage.image = currentPokemon.imageName
                viewLabel.text = currentPokemon.name
                viewLabelTwo.text = currentPokemon.pokedexID
                viewColour?.backgroundColor = currentPokemon.colour
            }
        } else {
            let imageView = cell.viewWithTag(1000) as? UIImageView
            let pokemonTitle = cell.viewWithTag(1001) as? UILabel
            let pokemonID = cell.viewWithTag(1002) as? UILabel
            let colourView = cell.viewWithTag(1003)
            
            if let imageView = imageView, let pokemonTitle = pokemonTitle, let pokemonID = pokemonID {
                let currentPokemon = viewModel.getPokemon(byIndex: indexPath.item)
                imageView.image = currentPokemon.image
                pokemonTitle.text = currentPokemon.name
                pokemonID.text = currentPokemon.id
                colourView?.backgroundColor = currentPokemon.colour
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokemonViewController {
            let selectedPokemon = viewModel.getPokemon(byIndex: indexPath.row)
            destination.selectedPokemon = selectedPokemon
        }
    }
    
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
        
        if let indexPath = collectionView?.indexPathForItem(at: p) {
            
            let blurEffect = UIBlurEffect(style: .light)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = view.frame
            let alert = UIAlertController(title: "Add \(viewModel.getPokemon(byIndex: indexPath.item).name) to Favourites?", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Add Pokemon", style: .default) { (action) in
                
                let name = self.viewModel.getPokemon(byIndex: indexPath.item).name
                let description = self.viewModel.getPokemon(byIndex: indexPath.item).description
                let image = self.viewModel.getPokemon(byIndex: indexPath.item).image
                let id = self.viewModel.getPokemon(byIndex: indexPath.item).id
                let type = self.viewModel.getPokemon(byIndex: indexPath.item).type
                let hp = self.viewModel.getPokemon(byIndex: indexPath.item).HP
                let attack = self.viewModel.getPokemon(byIndex: indexPath.item).attack
                let defense = self.viewModel.getPokemon(byIndex: indexPath.item).defense
                let sa = self.viewModel.getPokemon(byIndex: indexPath.item).specialAttack
                let sd = self.viewModel.getPokemon(byIndex: indexPath.item).specialDefense
                let speed = self.viewModel.getPokemon(byIndex: indexPath.item).speed
                let colour = self.viewModel.getPokemon(byIndex: indexPath.item).colour
                
                favourites.append(Pokemon.init(name: name, description: description, imageName: image, pokedexID: id, type: type, HP: hp, attack: attack, defense: defense, specialAttack: sa, specialDefense: sd, speed: speed, colour: colour))
                print(favourites)
                
                visualEffectView.removeFromSuperview()
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                print("Success!")
                visualEffectView.removeFromSuperview()
            }
            view.addSubview(visualEffectView)
            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
    }
}

extension PokedexController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        inSearchMode = false
        collectionView?.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil {
            inSearchMode = false
            collectionView?.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            filteredPokemon = viewModel.pokemons.filter({ $0.name.range(of: searchText) != nil })
            collectionView?.reloadData()
        }
    }
}

extension PokedexController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = (collectionView.bounds.width - 130*2 - 20)/2
        return UIEdgeInsets(top: 32, left: leftRightInset, bottom: 20, right: leftRightInset)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
}
