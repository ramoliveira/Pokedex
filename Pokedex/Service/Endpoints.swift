//
//  Endpoints.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import Foundation

public enum Endpoints {
    var path: String {
        "https://pokeapi.co/api/v2/"
    }
    
    case pokemonById(id: Int)
    case pokemonByName(name: String)
    
    var url: URL {
        switch self {
        case .pokemonById(let id):
            return URL(string: path + "/pokemon/" + String(describing: id))!
        case .pokemonByName(let name):
            return URL(string: path + "/pokemon/" + name)!
        }
    }
}
