//
//  FavouritesTableViewController.swift
//  PokenDex
//
//  Created by Sabih on 31/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
import CoreData
import Kingfisher

private let reuseIdentifier = "FavCell"

class FavouritesTableViewController: UITableViewController {
    
    var favourites = [Favourites]()
    @IBOutlet var favouritesTable: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Reloads the tableview to the updated favourites
    override func viewWillAppear(_ animated: Bool) {
        loadPokemon()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritesTable.accessibilityLabel = "favouritesTable"
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
        cell.accessibilityIdentifier = "favCell_\(indexPath.row)"
        
        let pokName = cell.viewWithTag(3001) as? UILabel
        let pokImage = cell.viewWithTag(3002) as? UIImageView
        
        if let pokName = pokName, let pokImage = pokImage {
            
            pokName.accessibilityIdentifier = "nameLabel"
            let currentPokemon = favourites[indexPath.item]
            pokName.text = currentPokemon.name
            pokImage.kf.setImage(with: URL(string: currentPokemon.image!))
        }
        
        return cell
    }
    
    // Sets up the swipe to remove feature
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(favourites[indexPath.row])
            favourites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            savePokemon()
            self.tableView.reloadData()
        }
    }
    
    // Lets the user access the detail Pokemon view through the favourited Pokemon
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell,
            let indexPath = self.tableView?.indexPath(for: cell) else {return}
        if let destination = segue.destination as? PokemonViewController {
            destination.id = Int(favourites[indexPath.item].id)
        }
    }
    
}
