//
//  PokemonsViewModel.swift
//  PokenDex
//
//  Created by Sabih on 24/9/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import Foundation

class PokemonsViewModel {
    
    var pokemons: Pokemon?
    let service = PokendexService()
    
    init() {}
    
    func getPokemons(url: String, completion: @escaping (Result<Pokemon?, HttpError>) -> Void) {
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
                        
                    } catch(let error) {
                        completion(.failure(.noConnectivity))
                    }
                    
                } else {
                    completion(.failure(.noConnectivity))
                }
            case .failure(let error):
                completion(.failure(.noConnectivity))
            }
        }
    }
}
