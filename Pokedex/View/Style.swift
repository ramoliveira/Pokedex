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
    
    enum TextColor {
        case description
        case name
        case id
        
        var color: Color {
            switch self {
            case .description:
                return Color(red: 0.45, green: 0.45, blue: 0.46)
            case .name:
                return Color.white
            case .id:
                return Color(red: 0.23, green: 0.23, blue: 0.27)
            }
        }
    }
    
    struct BackgroundColor {
        static func color(_ pokemonType: PokemonType) -> Color {
            Color("Background-" + pokemonType.rawValue)
        }
    }
    
    struct TypeColor {
        static func color(_ pokemonType: PokemonType) -> Color {
            Color("Type-" + pokemonType.rawValue)
        }
    }
}
