//
//  Weight.swift
//  Pokedex
//
//  Created by Ramon Almeida on 22/10/21.
//

import Foundation

public typealias WeightType = Weight.Kind

public struct Weight {
    public enum Kind: String {
        case light = "Light"
        case normal = "Normal"
        case heavy = "Heavy"
        
        static var all: [WeightType] = [
            .light,
            .normal,
            .heavy
        ]
    }
    
    var value: Double
    var kind: WeightType
    
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
