//
//  FavouritesTableViewController.swift
//  PokenDex
//
//  Created by Sabih on 31/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FavCell"

class FavouritesTableViewController: UITableViewController {
    
    var favourites: [Pokemon] = [] {
        didSet {
            tableView.reloadData()
        }
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
        pokName?.text = favourites[indexPath.row].name
        
        return cell
        
    }
}
