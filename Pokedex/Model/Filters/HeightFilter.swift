//
//  HeightFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

extension Array where Element == HeightType {
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

public class HeightFilter: Filter {
    public typealias Arg = HeightType
    
    @Published public var args: [HeightType]
    
    required public init(args: [HeightType]) {
        self.args = args
    }
    
    public func apply(pokemons: [Pokemon]) -> [Pokemon] {
        pokemons.filter { pokemon in
            return args.contains(pokemon.height.kind)
        }
    }
}
