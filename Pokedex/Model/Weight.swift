//
//  Weight.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/10/21.
//

import Foundation

public struct Weight {
    public enum Kind {
        case light
        case normal
        case heavy
        
        static var all: [Weight.Kind] = [
            .light,
            .normal,
            .heavy
        ]
    }
    
    var value: Double
    var kind: Kind
    
    init(value: Int) {
        self.value = Double(value) / 10
        if self.value < 60.0 {
            self.kind = .light
        } else if self.value < 300.0 {
            self.kind = .normal
        } else {
            self.kind = .heavy
        }
    }
}
