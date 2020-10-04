//
//  FavouritesTableViewController.swift
//  PokenDex
//
//  Created by Sabih on 31/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "FavCell"

class FavouritesTableViewController: UITableViewController {
    
    var favourites = [Favourites]()
    
    // Reloads the tableview to the updated favourites
    override func viewWillAppear(_ animated: Bool) {
        loadPokemon()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadPokemon() {
        let request: NSFetchRequest<Favourites> = Favourites.fetchRequest()
        do {
            favourites = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    func savePokemon() {
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
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
//            pokImage.image = currentPokemon.imageName
        }
        
        return cell
    }
    
    // Sets up the swipe to remove feature
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favourites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
    }
    
    // Lets the user access the detail Pokemon view through the favourited Pokemon
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell,
            let indexPath = self.tableView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokemonViewController {
//            let selectedPokemon = getFavourite(byIndex: indexPath.row)
//            destination.selectedPokemon = selectedPokemon
        }
    }
    
}
