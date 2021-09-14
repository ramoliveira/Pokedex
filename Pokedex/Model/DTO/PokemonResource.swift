//
//  PokemonResource.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import Foundation

public struct PokemonResource: Decodable {
    var id: Int?
    var name: String?
    var height: Int?
    var weight: Int?
    var sprites: PokemonSpritesResource?
    var types: [PokemonTypeResource]?
}
