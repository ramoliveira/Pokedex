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
    var height: Int
    var weight: Int
    var sprite: Image
    var types: [PokemonType]
    
    init(id: Int, name: String, height: Int, weight: Int, sprite: Image, types: [String]) {
        self.id = id
        self.name = name.capitalized
        self.height = height
        self.weight = weight
        self.sprite = sprite
        self.types = types.unique.map({ stringType in
            return PokemonType(rawValue: stringType) ?? .normal
        })
    }
    
    init() {
        self.id = 0
        self.name = "Test".capitalized
        self.height = 0
        self.weight = 0
        self.sprite = Image(uiImage: UIImage())
        self.types = [.normal]
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
