//
//  WeaknessFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public class WeaknessFilter: Filter {
    public typealias Arg = PokemonType
    
    @Published public var args: [PokemonType]
    
    required public init(args: [PokemonType]) {
        self.args = args
    }
    
    public func apply(pokemons: [Pokemon]) -> [Pokemon] {
        pokemons.filter { pokemon in
            return pokemon.defenses.weaknesses.contains(args)
        }
    }
}
