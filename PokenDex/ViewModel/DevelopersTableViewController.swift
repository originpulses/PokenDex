//
//  DevelopersTableViewController.swift
//  PokenDex
//
//  Created by Sabih on 30/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class DevelopersTableViewController: UITableViewController {

    private let viewModel = DevelopersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let imageView = cell.viewWithTag(2000) as? UIImageView
        let devName = cell.viewWithTag(2001) as? UILabel
        
        if let imageView = imageView, let devName = devName {
            let currentItem = viewModel.getItems(byIndex: indexPath.row)
            imageView.image = currentItem.image
            devName.text = currentItem.name
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedRow = self.tableView.indexPathForSelectedRow else {return}
        
        let destination = segue.destination as? DevelopersViewController
        let selectedItem = viewModel.getItems(byIndex: selectedRow.row)
        destination?.selectedItem = selectedItem
    }
}
