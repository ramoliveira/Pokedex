//
//  WeaknessFilter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public struct WeaknessFilter: Filter {
    public typealias Args = PokemonType
    
    public func apply(pokemons: [Pokemon], args: PokemonType...) -> [Pokemon] {
        pokemons.filter { pokemon in
            return pokemon.defenses.weaknesses.contains(args)
        }
    }
}
