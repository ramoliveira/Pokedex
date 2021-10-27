//
//  Height.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public typealias HeightType = Height.Kind

public struct Height {
    public enum Kind: String {
        case short = "Short"
        case medium = "Medium"
        case tall = "Tall"
        
        static var all: [HeightType] = [
            .short,
            .medium,
            .tall
        ]
    }
    
    var value: Double
    var kind: HeightType
    
    init(value: Int) {
        self.value = Double(value) / 10
        if self.value < 1 {
            self.kind = .short
        } else if self.value < 1.7 {
            self.kind = .medium
        } else {
            self.kind = .tall
        }
    }
}
