//
//  Filter.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public protocol Filter {
    associatedtype Args
    
    func apply(pokemons: [Pokemon], args: Args...) -> [Pokemon]
}
