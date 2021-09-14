//
//  PokemonType.swift
//  Pokedex
//
//  Created by Ramon Dias on 16/09/21.
//

import Foundation

enum PokemonType: String, Identifiable {
    case grass = "Grass"
    case fire = "Fire"
    case water = "Water"
    case bug = "Bug"
    case normal = "Normal"
    case poison = "Poison"
    case electric = "Electric"
    case ground = "Ground"
    case fairy = "Fairy"
    case fighting = "Fighting"
    
    var id: String {
        return String(describing: rawValue)
    }
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "grass":
            self = .grass
        case "fire":
            self = .fire
        case "water":
            self = .water
        case "bug":
            self = .bug
        case "normal":
            self = .normal
        case "poison":
            self = .poison
        case "electric":
            self = .electric
        case "ground":
            self = .ground
        case "fairy":
            self = .fairy
        case "fighting":
            self = .fighting
        default:
            self = .normal
        }
    }
}
