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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// Extension for Controlling PokeCells
extension PokedexController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokeCell
        return cell
    }
}
