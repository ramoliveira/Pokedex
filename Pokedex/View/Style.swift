//
//  Style.swift
//  Pokedex
//
//  Created by Ramon Dias on 16/09/21.
//

import SwiftUI

struct Style {
    enum Font {
        case bold
        case medium
        case regular
        
        func font(_ size: CGFloat) -> SwiftUI.Font {
            switch self {
            case .bold:
                return SwiftUI.Font.custom("SF Pro Display Bold", size: size)
            case .medium:
                return SwiftUI.Font.custom("SF Pro Display Medium", size: size)
            case .regular:
                return SwiftUI.Font.custom("SF Pro Display Regular", size: size)
            }
        }
    }
    
    struct Color {
        struct Text {
            static let description: SwiftUI.Color = SwiftUI.Color(red: 0.45, green: 0.45, blue: 0.46)
            static let title: SwiftUI.Color = SwiftUI.Color(red: 0.09, green: 0.09, blue: 0.106)
            static let name: SwiftUI.Color = SwiftUI.Color.white
            static let id: SwiftUI.Color = SwiftUI.Color(red: 0.23, green: 0.23, blue: 0.27)
        }
        
        struct View {
            static let textField: SwiftUI.Color = SwiftUI.Color(red: 0.95, green: 0.95, blue: 0.95)
        }
        
        struct Pokemon {
            static func background(_ pokemonType: PokemonType) -> SwiftUI.Color {
                SwiftUI.Color("Background-"+pokemonType.rawValue)
            }
            
            static func type(_ pokemonType: PokemonType) -> SwiftUI.Color {
                SwiftUI.Color("Type-"+pokemonType.rawValue)
            }
        }
    }
    
    struct Asset {
        struct General {
            static let back = Image("Back", bundle: .main)
            static let filter = Image("Filter", bundle: .main)
            static let front = Image("Front", bundle: .main)
            static let generation = Image("Generation", bundle: .main)
            static let search = Image("Search", bundle: .main)
            static let sort = Image("Sort", bundle: .main)
        }
        
        struct Height {
            static let tall = Image("Tall", bundle: Bundle.main)
            static let medium = Image("Medium", bundle: .main)
            static let small = Image("Small", bundle: .main)
        }
        
        struct Weight {
            static let heavy = Image("Heavy", bundle: .main)
            static let normal = Image("Normal", bundle: .main)
            static let light = Image("Light", bundle: .main)
        }
        
        struct Pattern {
            static let pokeball = Image("Pokeball", bundle: .main)
            static let grid6x3 = Image("6x3", bundle: .main)
            static let grid10x5 = Image("10x5", bundle: .main)
        }
    }
}
