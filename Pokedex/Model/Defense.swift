//
//  Defense.swift
//  Pokedex
//
//  Created by Ramon Almeida on 21/10/21.
//

import Foundation

public extension Array where Element == Defense {
    var weaknesses: [PokemonType] {
        self.filter { defense in
            return defense.effectiveness == .double
        }.map { defense in
            defense.against
        }
    }
}

public struct Defense {
    enum Effectiveness: Double {
        case double = 2
        case half = 0.5
        case quarter = 0.25
        case normal = 0
        
        var toString: String {
            switch self {
            case .double:
                return "2"
            case .half:
                return "½"
            case .quarter:
                return "¼"
            case .normal:
                return ""
            }
        }
        
        init?(rawValue: Double) {
            switch rawValue {
            case 2.0:
                self = .double
            case 0.5:
                self = .half
            case 0.25:
                self = .quarter
            case 0:
                self = .normal
            default:
                return nil
            }
        }
    }
    
    var against: PokemonType
    var effectiveness: Effectiveness
    
    init(against: PokemonType, value: Effectiveness) {
        self.against = against
        self.effectiveness = value
    }
    
    init(against: PokemonType, value: Double) {
        self.against = against
        self.effectiveness = Effectiveness(rawValue: value) ?? .normal
    }
}
