//
//  FavouritesTableViewController.swift
//  PokenDex
//
//  Created by Sabih on 31/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

var favourites: [Pokemon] = [] // Holds Favourited Pokemons. This will be done via Core Data in Assignment 2
private let reuseIdentifier = "FavCell"

class FavouritesTableViewController: UITableViewController {
    
    // Reloads the tableview to the updated favourites
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let pokName = cell.viewWithTag(3001) as? UILabel
        let pokImage = cell.viewWithTag(3002) as? UIImageView
        
        if let pokName = pokName, let pokImage = pokImage {
            
            let currentPokemon = favourites[indexPath.item]
            pokName.text = currentPokemon.name
            pokImage.image = currentPokemon.imageName
        }
        
        return cell
    }
    
    // Sets up the swipe to remove feature
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favourites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Lets the user access the detail Pokemon view through the favourited Pokemon
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell,
            let indexPath = self.tableView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokemonViewController {
            let selectedPokemon = getFavourite(byIndex: indexPath.row)
            destination.selectedPokemon = selectedPokemon
        }
    }
    
}

// Gets the Pokemon Data so that it can be passed through the segue
func getFavourite(byIndex index: Int) -> (name: String, description: String, image: UIImage?, id: String, type: String, HP: String, attack: String, defense: String, specialAttack: String, specialDefense: String, speed: String, colour: UIColor?) {
    
    let name = favourites[index].name
    let description = favourites[index].description
    let image = favourites[index].imageName
    let id = favourites[index].pokedexID
    let type = favourites[index].type
    let HP = favourites[index].HP
    let attack = favourites[index].attack
    let defense = favourites[index].defense
    let specialAttack = favourites[index].specialAttack
    let specialDefense = favourites[index].specialDefense
    let speed = favourites[index].specialDefense
    let colour = favourites[index].colour
    
    return (name, description, image, id, type, HP, attack, defense, specialAttack, specialDefense, speed, colour)
}
