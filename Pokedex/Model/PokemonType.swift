//
//  PokemonType.swift
//  Pokedex
//
//  Created by Ramon Dias on 16/09/21.
//

import Foundation

public enum PokemonType: String, Identifiable {
    case bug        = "Bug"
    case dark       = "Dark"
    case dragon     = "Dragon"
    case electric   = "Electric"
    case fairy      = "Fairy"
    case fighting   = "Fighting"
    case fire       = "Fire"
    case flying     = "Flying"
    case ghost      = "Ghost"
    case grass      = "Grass"
    case ground     = "Ground"
    case ice        = "Ice"
    case normal     = "Normal"
    case poison     = "Poison"
    case psychic    = "Psychic"
    case rock       = "Rock"
    case steel      = "Steel"
    case water      = "Water"
    
    public var id: String {
        return String(describing: rawValue)
    }
    
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "Bug".lowercased():
            self = .bug
        case "Dark".lowercased():
            self = .dark
        case "Dragon".lowercased():
            self = .dragon
        case "Electric".lowercased():
            self = .electric
        case "Fairy".lowercased():
            self = .fairy
        case "Fighting".lowercased():
            self = .fighting
        case "Fire".lowercased():
            self = .fire
        case "Flying".lowercased():
            self = .flying
        case "Ghost".lowercased():
            self = .ghost
        case "Grass".lowercased():
            self = .grass
        case "Ground".lowercased():
            self = .ground
        case "Ice".lowercased():
            self = .ice
        case "Normal".lowercased():
            self = .normal
        case "Poison".lowercased():
            self = .poison
        case "Psychic".lowercased():
            self = .psychic
        case "Rock".lowercased():
            self = .rock
        case "Steel".lowercased():
            self = .steel
        case "Water".lowercased():
            self = .water
        default:
            self = .normal
        }
    }
    
    static var all: [String] {
        [
            "Bug",
            "Dark",
            "Dragon",
            "Electric",
            "Fairy",
            "Fighting",
            "Fire",
            "Flying",
            "Ghost",
            "Grass",
            "Ground",
            "Ice",
            "Normal",
            "Poison",
            "Psychic",
            "Rock",
            "Steel",
            "Water"
        ]
    }
}
