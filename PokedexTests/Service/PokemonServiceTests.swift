//
//  PokemonServiceTests.swift
//  PokedexTests
//
//  Created by Ramon Dias on 13/09/21.
//

import XCTest
import Combine
@testable import Pokedex

class PokemonServiceTests: XCTestCase {
    var service: PokemonServicing!
    var cancelables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        service = Container.shared.resolve(PokemonServicing.self)
        cancelables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        service = nil
        cancelables = nil
        super.tearDown()
    }
    
    func testPokemonService_fetch_pokemonResourceById() {
        let expectation = XCTestExpectation(description: "Expecting pokemon resource fetched!")
        
        service.fetchPokemonResource(byId: 1)
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                    break
                case .failure(let error):
                    XCTFail("FAILED error: \(error.localizedDescription)")
                    expectation.fulfill()
                }
            } receiveValue: { resource in
                XCTAssertNotNil(resource.name)
                expectation.fulfill()
            }.store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPokemonService_fetch_pokemonResourceByName() {
        let expectation = XCTestExpectation(description: "Expecting pokemon resource fetched!")
        
        service.fetchPokemonResource(byName: "pikachu")
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                    break
                case .failure(let error):
                    XCTFail("FAILED error: \(error.localizedDescription)")
                    expectation.fulfill()
                }
            } receiveValue: { resource in
                XCTAssertNotNil(resource.name)
                expectation.fulfill()
            }.store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPokemonService_fetch_multiplePokemonsResources() {
        let expectation = XCTestExpectation(description: "Expecting pokemons resources fetched!")
        
        do {
            try service.fetchPokemons(startId: 1, finalId: 5)
                .sink { completion in
                    switch completion {
                    case .finished:
                        expectation.fulfill()
                        break
                    case .failure(let error):
                        XCTFail("FAILED error: \(error.localizedDescription)")
                        expectation.fulfill()
                    }
                } receiveValue: { resource in
                    XCTAssert(!resource.isEmpty)
                    expectation.fulfill()
                }.store(in: &cancelables)
        } catch let error {
            XCTFail("FAILED error: \(error.localizedDescription)")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testPokemonService_fetch_pokemon() {
        let expectation = XCTestExpectation(description: "Expecting pokemon fetched!")
        
        service.fetchPokemon(byId: 1)
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                    break
                case .failure(let error):
                    XCTFail("FAILED error: \(error.localizedDescription)")
                    expectation.fulfill()
                }
            } receiveValue: { pokemon in
                XCTAssert(!pokemon.name.isEmpty)
                expectation.fulfill()
            }.store(in: &cancelables)
        
        wait(for: [expectation], timeout: 5)
    }
}
