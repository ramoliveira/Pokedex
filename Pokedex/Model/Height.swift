//
//  Height.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation



public struct Height {
    public enum Kind {
        case small
        case medium
        case tall
        
        static var all: [Height.Kind] = [
            .small,
            .medium,
            .tall
        ]
    }
    
    var value: Double
    var kind: Kind
    
    init(value: Int) {
        self.value = Double(value) / 10
        if self.value < 1 {
            self.kind = .small
        } else if self.value < 1.7 {
            self.kind = .medium
        } else {
            self.kind = .tall
        }
    }
}
