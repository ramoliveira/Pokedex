//
//  PokemonViewModelMock.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/09/21.
//

import SwiftUI

class PokemonServiceMock: PokemonService {}

class PokemonViewModelMock: PokemonViewModel {
    override init(service: PokemonServicing = PokemonServiceMock()) {
        super.init(service: service)
    }
    
    override func fetchPokemon(byId id: Int) {
        dataSource = [
            Pokemon(
                id: 1,
                name: "Ditto",
                height: 20,
                weight: 20,
                sprite: Image(uiImage: UIImage()),
                types: ["Normal"]
            )
        ]
    }
    
    override func fetchPokemon(byName name: String) {
        dataSource = [
            Pokemon(
                id: 1,
                name: "Ditto",
                height: 20,
                weight: 20,
                sprite: Image(uiImage: UIImage()),
                types: ["Normal"]
            )
        ]
    }
    
    override func fetchPokemons(fromId startId: Int, toId finalId: Int) {
        dataSource = [
            Pokemon(
                id: 1,
                name: "Ditto",
                height: 20,
                weight: 20,
                sprite: Image(uiImage: UIImage()),
                types: ["Normal"]
            )
        ]
    }
}