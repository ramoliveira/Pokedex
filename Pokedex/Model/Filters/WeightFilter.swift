//
//  WeightFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/10/21.
//

import Foundation

extension Array where Element == Weight.Kind {
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

public struct WeightFilter: Filter {
    public typealias Args = Weight.Kind
    
    public func apply(pokemons: [Pokemon], args: Weight.Kind...) -> [Pokemon] {
        pokemons.filter { pokemon in
            return args.contains(pokemon.weight.kind)
        }
    }
}
