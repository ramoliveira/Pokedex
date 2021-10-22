//
//  TypeFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

extension Array where Element == PokemonType {
    func contains(_ collection: [Element]) -> Bool {
        var contains: Bool = false
        self.forEach { element in
            if collection.contains(element) {
                contains = true
            }
        }
        return contains
    }
}

public struct TypeFilter: Filter {
    public typealias Args = PokemonType
    
    public func apply(pokemons: [Pokemon], args: PokemonType...) -> [Pokemon] {
        pokemons.filter { pokemon in
            return pokemon.types.contains(args)
        }
    }
}
