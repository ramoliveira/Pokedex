//
//  HeightFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

extension Array where Element == Height.Kind {
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

public struct HeightFilter: Filter {
    public typealias Args = Height.Kind
    
    public func apply(pokemons: [Pokemon], args: Height.Kind...) -> [Pokemon] {
        pokemons.filter { pokemon in
            return args.contains(pokemon.height.kind)
        }
    }
}
