//
//  Pokemons.swift
//  PokenDex
//
//  Created by Sabih on 20/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

struct Pokemons : Model {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [Results]?
    
    init(count: Int?, next: String, previous: String, results: [Results]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
