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
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inSearchMode ? filteredPokemon.count : viewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if inSearchMode {
            let viewImage = cell.viewWithTag(1000) as? UIImageView
            let viewLabel = cell.viewWithTag(1001) as? UILabel

            if let viewImage = viewImage, let viewLabel = viewLabel {
                let currentPokemon = filteredPokemon[indexPath.item]
                viewImage.image = currentPokemon.imageName
                viewLabel.text = currentPokemon.title
            }
        } else {
            let imageView = cell.viewWithTag(1000) as? UIImageView
            let pokemonTitle = cell.viewWithTag(1001) as? UILabel
            
            if let imageView = imageView, let pokemonTitle = pokemonTitle {
                let currentPokemon = viewModel.getPokemon(byIndex: indexPath.item)
                imageView.image = currentPokemon.image
                pokemonTitle.text = currentPokemon.title
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
            filteredPokemon = viewModel.pokemons.filter({ $0.title.range(of: searchText) != nil })
            collectionView?.reloadData()
        }
    }
}
