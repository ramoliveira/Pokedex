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

public class TypeFilter: Filter {
    public typealias Arg = PokemonType
    
    @Published public var args: [PokemonType]
    
    required public init(args: [PokemonType]) {
        self.args = args
    }
    
    public func apply(pokemons: [Pokemon]) -> [Pokemon] {
        pokemons.filter { pokemon in
            return pokemon.types.contains(args)
        }
    }
}
