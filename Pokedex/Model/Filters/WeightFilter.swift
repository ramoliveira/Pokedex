//
//  WeightFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/10/21.
//

import Foundation

extension Array where Element == WeightType {
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

public class WeightFilter: Filter {
    public typealias Arg = WeightType
    
    @Published public var args: [WeightType]
    
    required public init(args: [WeightType]) {
        self.args = args
    }
    
    public func apply(pokemons: [Pokemon]) -> [Pokemon] {
        pokemons.filter { pokemon in
            return args.contains(pokemon.weight.kind)
        }
    }
}
