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
    
    private let viewModel = PokemonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell, let indexPath = self.collectionView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokedexController {
            let selectedPokemon = viewModel.getPokemon(byIndex: indexPath.row)
            destination.selectedPokemon = selectedPokemon
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let imageView = cell.viewWithTag(1000) as? UIImageView
        let pokemonTitle = cell.viewWithTag(1001) as? UILabel
    }
}
