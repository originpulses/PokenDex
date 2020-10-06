//
//  PokenDexTests.swift
//  PokenDexTests
//
//  Created by Sabih on 25/7/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import XCTest
@testable import PokenDex

class PokenDexTests: XCTestCase {
    
    var pokemonsViewModel = PokemonsViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Ensuring values are added in successfully and validate to their corresponding types
    func testForPokemonDetailModel() {
        
        let type = Type(name: "Fire", url: "url")
        let types = Types(slot: 0, type: type)
        let stat = Stat(name: "HP", url: "url")
        let stats = Stats(base_stat: 78, effort: 0, stat: stat)
        let species = Species(name: "Charizard", url: "url")
        let model = PokemonDetail(id: 6, name: "Charizard", stats: [stats], types: [types], species: species)
        
        XCTAssertEqual(model.name, "Charizard")
        XCTAssertEqual(model.id, 6)
        XCTAssertEqual(model.stats?[0].stat?.name, "HP")
        XCTAssertEqual(model.types?[0].type?.name, "Fire")
        
    }
    
    func testGetPokemonWithValidURL() {
        
        let url = "https://pokeapi.co/api/v2/pokemon"
        
        pokemonsViewModel.getPokemons(url: url) { results in
            switch results {
            case .success(let data):
                XCTAssert(data != nil)
                XCTAssert(data?.count == 1050)
                XCTAssert(data?.next == "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20")
                
            case .failure(let error):
                XCTFail("API Response Failed: \(error.localizedDescription)")
            }
        }
        
    }
    
    func testGetPokemonWithInvalidURL() {
        
        let url = "https://pokeapi.co/api/v2/pokemn"
        
        pokemonsViewModel.getPokemons(url: url) { results in
            switch results {
            case .success(let data):
                XCTAssertNil(data)
                XCTAssert(data?.count == 1050)
                XCTAssert(data?.next == "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20")
                
            case .failure(let error):
                XCTFail("API Response Failed: \(error.localizedDescription)")
            }
        }
        
    }
    
    func testingPokemonResults() {
        
        let url = "https://pokeapi.co/api/v2/pokemon"
        
        pokemonsViewModel.getPokemons(url: url) { results in
            switch results {
            case .success(let data):
                XCTAssert(data != nil)
                XCTAssert(data?.results?.count == 20)
                
            case .failure(let error):
                XCTFail("API Response Failed: \(error.localizedDescription)")
            }
        }
        
    }
    
}
