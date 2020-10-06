//
//  PokemonsViewModel.swift
//  PokenDex
//
//  Created by Sabih on 24/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

class PokemonsViewModel {
    
    var pokemons: Pokemons?
    let service = PokendexService()
    
    init() {}
    
    // Retrieves all the results from PokeAPI
    func getPokemons(url: String, completion: @escaping (Result<Pokemons?, HttpError>) -> Void) {
        service.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                    do {
                        let results = try JSONDecoder().decode(Pokemons.self, from: data!)
                        if self.pokemons == nil {
                            self.pokemons = results
                            completion(.success(self.pokemons))
                        } else {
                            self.pokemons?.next = results.next
                            self.pokemons?.results?.append(contentsOf: results.results!)
                            completion(.success(self.pokemons))
                        }
                        
                    } catch( _) {
                        completion(.failure(.noConnectivity))
                    }
                    
                } else {
                    completion(.failure(.noConnectivity))
                }
            case .failure( _):
                completion(.failure(.noConnectivity))
            }
        }
    }
}
