//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ramon Dias on 15/09/21.
//

import SwiftUI

public struct Pokemon: Identifiable {
    public var id: Int
    var name: String
    var height: Height
    var weight: Weight
    var sprite: Image
    var types: [PokemonType]
    var defenses: [Defense]
    
    init(id: Int, name: String, height: Int, weight: Int, sprite: Image, types: [String]) {
        self.id = id
        self.name = name.capitalized
        self.height = Height(value: height)
        self.weight = Weight(value: weight)
        self.sprite = sprite
        self.types = types.unique.map({ stringType in
            return PokemonType(rawValue: stringType) ?? .normal
        })
        self.defenses = []
    }
    
    init(id: Int, name: String, height: Int, weight: Int, sprite: Image, types: [PokemonType]) {
        self.id = id
        self.name = name.capitalized
        self.height = Height(value: height)
        self.weight = Weight(value: weight)
        self.sprite = sprite
        self.types = types.unique
        self.defenses = []
    }
    
    init() {
        self.id = 0
        self.name = "Empty".capitalized
        self.height = Height(value: 0)
        self.weight = Weight(value: 0)
        self.sprite = Image(uiImage: UIImage())
        self.types = [.normal]
        self.defenses = []
    }
    
    #if DEBUG
    static let mock = Pokemon(id: 132,
                              name: "Ditto",
                              height: 3,
                              weight: 40,
                              sprite: Image("Ditto"),
                              types: ["Normal"])
    #endif
}
